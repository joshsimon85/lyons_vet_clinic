class AddColumnDeleteableToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :deleteable, :boolean, null: false
  end
end
