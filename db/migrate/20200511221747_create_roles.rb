class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
