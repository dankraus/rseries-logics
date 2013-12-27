class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :hex
      t.integer :r
      t.integer :g
      t.integer :b
      t.integer :hue
      t.integer :sat
      t.integer :val

      t.timestamps
    end
  end
end
