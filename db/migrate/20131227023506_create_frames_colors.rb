class CreateFramesColors < ActiveRecord::Migration
  def change
    create_table :frames_colors do |t|
      t.integer :color_id
      t.integer :frame_id

      t.timestamps
    end

    add_index :frames_colors, [:color_id, :frame_id]
  end
end
