class ChangeRolesDescriptionDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :roles, :description, nil
  end
end
