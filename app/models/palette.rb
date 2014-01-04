class Palette < ActiveRecord::Base

  has_many :colors_palettes
  has_many :colors, through: :colors_palettes

  accepts_nested_attributes_for :colors

  default_scope includes(:colors).order('created_at ASC')

  def self.recent(limit=10)
    self.last(limit)
  end
end
