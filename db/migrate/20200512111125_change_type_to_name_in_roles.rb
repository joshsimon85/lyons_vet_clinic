class ChangeTypeToNameInRoles < ActiveRecord::Migration[6.0]
  def change
    rename_column :roles, :type, :name
  end
end
