class ChangeDefaultsInColor < ActiveRecord::Migration
  def change
    change_column_default(:colors, :r, 0)
    change_column_default(:colors, :g, 0)
    change_column_default(:colors, :b, 0)
    change_column_default(:colors, :hex, "#000000")
    change_column_default(:colors, :hue, 0)
    change_column_default(:colors, :sat, 0)
    change_column_default(:colors, :val, 0)
  end
end
