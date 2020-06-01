class ChangeTitleToNameInPositions < ActiveRecord::Migration[6.0]
  def change
    rename_column :positions, :title, :name
  end
end
