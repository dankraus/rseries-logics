class Frame < ActiveRecord::Base

  belongs_to :animation
  has_many :frames_colors
  has_many :colors, through: :frames_colors

end
