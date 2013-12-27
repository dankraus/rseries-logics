class CreateColorsPalettes < ActiveRecord::Migration
  def change
    create_table :colors_palettes do |t|
      t.integer :color_id
      t.integer :palette_id

      t.timestamps
    end

    add_index :colors_palettes, [:color_id, :palette_id]
  end
end
