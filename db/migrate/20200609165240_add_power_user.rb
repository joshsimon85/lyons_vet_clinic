class AddPowerUser < ActiveRecord::Migration[6.0]
  def change
    power_user = Role.create({ :name => 'power user',
                               :description => 'External user',
                               :deletable => false })
    user = User.find_by(:full_name => 'Jon Doe')
    user.role = power_user
    user.save!(:validate => false)
  end
end
