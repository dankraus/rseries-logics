class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :animation_id
      t.string :number

      t.timestamps
    end
  end
end
