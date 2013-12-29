class Animation < ActiveRecord::Base

  after_create :seed_first_frame

  belongs_to :palette
  belongs_to :display_type
  has_many :frames

  def seed_first_frame
    frame = Frame.create(animation: self)
    frame.colors = Array.new(self.display_type.total_pixels, self.palette.colors.first)
  end

end
