class DisplayType < ActiveRecord::Base
  #attr_accessible :name
  attr_readonly :columns
  attr_readonly :rows

  def total_pixels
    columns * rows
  end
end
