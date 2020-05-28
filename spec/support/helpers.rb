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

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_button 'Sign in'
  end

  def create_role!
    visit new_role_path

    fill_in 'Name', :with => 'Admin'
    fill_in 'Description', :with => 'Admin role'

    click_button 'Submit'
  end

  def create_deletable_role!
    visit new_role_path

    fill_in 'Name', :with => 'Admin'
    fill_in 'Description', :with => 'Admin role'
    select 'false', :from => 'role_deletable'

    click_button 'Submit'
  end
end
