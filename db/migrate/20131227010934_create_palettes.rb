class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.integer :author_id

      t.timestamps
    end
  end
end
