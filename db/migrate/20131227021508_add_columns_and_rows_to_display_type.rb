class AddColumnsAndRowsToDisplayType < ActiveRecord::Migration
  def change
    add_column :display_types, :rows, :integer
    add_column :display_types, :columns, :integer
  end
end
