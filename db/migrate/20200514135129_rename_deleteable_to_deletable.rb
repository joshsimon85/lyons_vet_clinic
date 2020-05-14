class RenameDeleteableToDeletable < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :deleteable, :deletable
  end
end
