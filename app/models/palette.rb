class Palette < ActiveRecord::Base

  has_many :colors_palettes
  has_many :colors, through: :colors_palettes

  accepts_nested_attributes_for :colors
end
