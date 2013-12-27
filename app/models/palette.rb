class Palette < ActiveRecord::Base
  has_many :colors_palettes
  has_many :colors, through: :colors_palettes
end
