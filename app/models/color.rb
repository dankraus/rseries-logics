class Color < ActiveRecord::Base
  before_save :convert_from_hsv

  validates(:hue,
            {
              presence: true,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 360
              }
            })
  validates(:sat, :val,
            {
              presence: true,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 100
              }
            })
  validates(:r, :g, :b,
            {
              presence: true,
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 255
              }
            })

  has_many :colors_palettes
  has_many :palettes, through: :colors_palettes

  def convert_from_hsv
    rgb = hsv_to_rgb
    self.r = rgb[:r]
    self.g = rgb[:g]
    self.b = rgb[:b]

    self.hex = rgb_to_hex
  end

  def hsv_to_rgb
    h = self.hue / 360.0
    s = self.sat / 100.0
    v = self.val / 100.0

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

    {r: (r * 255).round, g: (g * 255).round, b: (b * 255).round }
  end

  def rgb_to_hex
    ['#', as_hex(self.r), as_hex(self.g), as_hex(self.b) ].join('').downcase
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
