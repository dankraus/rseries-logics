class Palette < ActiveRecord::Base
  has_many :colors, through: :colors_palettes
end
