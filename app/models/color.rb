class Color < ActiveRecord::Base
  attr_accessor :hue, :sat, :val, :r, :g, :b, :hex

  validates(:hue,
            {
              presence: true,
              numericality: {
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 360
              }
            })
  validates(:sat, :val,
            {
              presence: true,
              numericality: {
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 100
              }
            })
  validates(:r, :g, :b,
            {
              numericality: {
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 255
              }
            })

  has_many :colors_palettes
  has_many :palettes, through: :colors_palettes

  def hsv_to_rgb!
    h = @hue / 360.0
    s = @sat / 100.0
    v = @val / 100.0

    i = (h * 6).floor
    f = h * 6 - i
    p = v * (1 - s)
    q = v * (1 - f * s)
    t = v * (1 - (1 - f) * s)

    case (i % 6)
      when 0
        r = v
        g = t
        b = p
      when 1
        r = q
        g = v
        b = p
      when 2
        r = p
        g = v
        b = t
      when 3
        r = p
        g = q
        b = v
      when 4
        r = t
        g = p
        b = v
      when 5
        r = v
        g = p
        b = q
    end

    @r = (r * 255).round
    @g = (g * 255).round
    @b = (b * 255).round
  end

  def rgb_to_hex!
    @hex = ['#', as_hex(@r), as_hex(@g), as_hex(@b) ].join('').downcase
  end

  private
    def as_hex(num)
      if num < 16
        "0#{num.to_s(16)}"
      else
        num.to_s(16)
      end
    end

end
