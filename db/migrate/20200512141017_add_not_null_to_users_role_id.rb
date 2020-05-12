class AddNotNullToUsersRoleId < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :role_id, false
  end
end
