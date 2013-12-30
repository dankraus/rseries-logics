module PalettesHelper
  def render_palette(palette)
    content_tag(:div, content_tag(:p, "Hello world!"), class: "strong")
    # => <div class="strong"><p>Hello world!</p></div>
    content_tag(:div, render_palette_swatch(palette) )
  end

  def render_palette_swatch(palette)

    palette.colors.each do |color|

    end
  end

  #def gravatar_for(user, options = { size: 50 })
  #  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #  size = options[:size]
  #  gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  #  return image_tag(gravatar_url, alt:user.name, class: "gravatar")
  #end
end
