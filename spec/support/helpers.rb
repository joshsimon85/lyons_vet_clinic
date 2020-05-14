module Helpers
  def create_admin!
    role = create(:role, :name => 'admin')
    position = create(:position)

    create(:user, { :role => role, :position => position })
  end

  def create_power_user!
    role = create(:role, :name => 'power user')
    position = create(:position)

    create(:user, { :role => role, :position => position })
  end

  def create_employee!
    role = create(:role, :name => 'employee')
    position = create(:position)

    create(:user, { :role => role, :position => position })
  end

  def create_user!
    role = create(:role, :name => 'user')

    create(:user, :role => role)
  end
end
