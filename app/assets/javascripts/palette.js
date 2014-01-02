// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
    $('#addColorBtn').click(addColorBuilder);

    $('.slider').slider().on('slide', onSliderSlide);
});

var addColorBuilder = function(){
    var $palette = $('#palette-builder'),
        $colorBuilderTemplate = $('#new-color-builder-templ'),
        h = Math.round(Math.random() * 360),
        s = Math.round(Math.random() * 100),
        v = Math.round(Math.random() * 100);

    properties = calculateProperties(h, s, v);


    //$palette.append(newColorBuilder);
}

var onSliderSlide = function(ev){
    var $slider = $(ev.currentTarget),
        $colorBuilder =  $slider.parents('.color-builder'),
        $swatch =  $colorBuilder.find('.swatch'),
        sliderVal = $slider.val(),
        property = $slider.data('property'),
        hue = 0,
        sat = 0,
        val = 0;

    //set the right color property for the current slider
    $swatch.data(property, sliderVal);

    hue = $swatch.data('hue');
    sat = $swatch.data('sat');
    val = $swatch.data('val')

    //run color conversions
    properties = calculateProperties(hue, sat, val);
    //render the freshly converted properties in the swatch info display
    renderProperties(properties, $swatch, $colorBuilder.find('.info'));
}

function calculateProperties(hue,sat,val){
    var properties = {
        "hue": hue,
        "sat": sat,
        "val": val,
        "r": 0,
        "g": 0,
        "b": 0,
        "hex": ""
    }

    rgb = hsvToRgb(hue, sat, val);
    properties["r"] = rgb["r"];
    properties["g"] = rgb["g"];
    properties["b"] = rgb["b"];

    properties["hex"] = rgbToHex(rgb["r"], rgb["g"], rgb["b"]);

    return properties;
}

function renderProperties(properties, $swatch, $info){
    for(var property in properties){
        $info.find('.value[data-property='+property+']').text(properties[property]);
    }

    $swatch.css('backgroundColor', properties["hex"]);
}

/**
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  Array           The RGB representation
 */
function hsvToRgb(h, s, v) {
    var r, g, b;

    h = h/360.0
    s = s/100.0
    v = v/100.0

    var i = Math.floor(h * 6);
    var f = h * 6 - i;
    var p = v * (1 - s);
    var q = v * (1 - f * s);
    var t = v * (1 - (1 - f) * s);

    switch (i % 6) {
        case 0: r = v, g = t, b = p; break;
        case 1: r = q, g = v, b = p; break;
        case 2: r = p, g = v, b = t; break;
        case 3: r = p, g = q, b = v; break;
        case 4: r = t, g = p, b = v; break;
        case 5: r = v, g = p, b = q; break;
    }

    return {
        "r": Math.round((r * 255)),
        "g": Math.round((g * 255)),
        "b": Math.round((b * 255))
    };
}

function rgbToHex(r, g, b){
  function asHex(num){
    if(num < 16)
        var val = "0"+num.toString(16);
    else
      var val = num.toString(16);

    return val;
  }

  return  ['#', asHex(r), asHex(g), asHex(b) ].join('')
}