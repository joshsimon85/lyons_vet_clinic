require 'rails_helper'

describe 'CRUD user actions' do
  let(:jon) { create_admin! }

  before  do
    create(:role, :name => 'power user')
    create(:role, :name => 'user')
    create(:role, :name => 'employee')
    create(:position, :name => 'Vet Tech')

    sign_in(jon)
  end

  scenario 'creating a new invalid power user', :js => true do
    visit new_user_path

    expect(page).to have_select 'Role',
      selected: 'Employee',
      options: ['Admin', 'Employee', 'User', 'Power User']

    expect(page).to have_select 'Position',
      selected: 'None', with_options: ['None']

    fill_in 'Full Name', :with => ''
    fill_in 'Email', :with => 'jane@testing.com'
    select 'Power User', :from => 'user_role_id'

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the user.')
    expect(page).to have_content("Full name can't be blank")
    expect(page).to have_content('prevented your user from being created')
  end

  scenario 'creating a new invalid admin', :js => true do
    visit new_user_path

    fill_in 'Full Name', :with => 'Jane Testin'
    fill_in 'Email', :with => 'jane@testing.com'
    select 'Admin', :from => 'user_role_id'

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the user.')
    expect(page).to have_content('Description is required for employees')
    expect(page).to have_content('Position is required for employees')
    expect(page).to have_content('Profile image is required for employees')
    expect(page).to have_content('prevented your user from being created')
  end

  scenario 'creating a new invalid employee', :js => true do
    visit new_user_path

    fill_in 'Full Name', :with => 'Jane Testin'
    fill_in 'Email', :with => 'jane@testing.com'
    select 'Employee', :from => 'user_role_id'

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the user.')
    expect(page).to have_content('Description is required for employees')
    expect(page).to have_content('Profile image is required for employees')
  end

  scenario 'creating a new invalid user', :js => true do
    visit new_user_path

    fill_in 'Full Name', :with => ''
    fill_in 'Email', :with => ''
    select 'User', :from => 'user_role_id'

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the user.')
    expect(page).to have_content("Full name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content('Email must be properly formatted')
    expect(page).to have_content('prevented your user from being created')
  end

  scenario 'creating a valid power user' do
    visit new_user_path

    fill_in 'Full Name', :with => 'Jon Power User'
    fill_in 'Email', :with => 'jon@poweruser.com'
    select 'Power User', :from => 'user_role_id'

    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The user has been successfully created.')
  end

  scenario 'creating a valid admin user' do
    visit new_user_path

    fill_in 'Full Name', :with => 'Jon Power User'
    fill_in 'Email', :with => 'jon@poweruser.com'
    select 'Admin', :from => 'user_role_id'
    select 'Vet Tech', :from => 'user_position_id'
    fill_in 'Description', :with => 'Description'
    attach_file 'Image', image_file_path
    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The user has been successfully created.')
  end
end
