class CreateAnimations < ActiveRecord::Migration
  def change
    create_table :animations do |t|
      t.integer :author_id
      t.integer :palette_id
      t.string :name
      t.integer :display_type_id

      t.timestamps
    end
  end
end
