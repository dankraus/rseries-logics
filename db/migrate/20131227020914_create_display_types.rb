class CreateDisplayTypes < ActiveRecord::Migration
  def change
    create_table :display_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
