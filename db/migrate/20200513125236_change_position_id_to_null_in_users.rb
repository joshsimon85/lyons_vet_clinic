class ChangePositionIdToNullInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :position_id, true
  end
end
