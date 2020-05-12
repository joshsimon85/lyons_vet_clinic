class AddDesciptionToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :description, :text, :null => false, :default => 'user'
  end
end
