class AddNotNullToRoles < ActiveRecord::Migration[6.0]
  def change
    change_column_null :roles, :name, false
  end
end
