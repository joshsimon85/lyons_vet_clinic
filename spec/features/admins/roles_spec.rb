require 'rails_helper'

describe 'CRUD role actions' do
  let(:jon) { create_admin! }

  before  do
    sign_in(jon)
  end

  scenario 'creating a new invalid role from roles#index', :js => true do
    visit roles_path

    click_link 'Create A New Role'
    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the role.')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('prevented your role from being created')
  end

  scenario 'creating a new valid role from roles index', :js => true do
    visit roles_path

    click_link 'Create A New Role'
    fill_in 'Name', :with => 'Power User'
    fill_in 'Description', :with => 'External User'
    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The role has been successfully created.')
    expect(page).to have_current_path(roles_path)
  end

  scenario 'creating a new valid role from the roles new path', :js => true do
    visit new_role_path

    fill_in 'Name', :with => 'Power User'
    fill_in 'Description', :with => 'External User'
    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The role has been successfully created.')
    expect(page).to have_current_path(roles_path)
  end

  scenario 'creating a new invalid role from roles#new', :js => true do
    visit new_role_path

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the role.')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('prevented your role from being created')
  end

  scenario 'updating a role with invalid fields', :js => true do
    create(:role, :name => 'user')

    visit roles_path

    click_link 'user'
    click_link 'Edit User'
    fill_in 'Name', :with => ''
    click_button 'Update'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error updating ')
    expect(page).to have_content('prevented your role from being updated')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'updating a role with valid fields' do
    create(:role, :name => 'user')

    visit roles_path

    click_link 'user'
    click_link 'Edit User'
    fill_in 'Name', :with => 'User 2'
    click_button 'Update'

    expect(page).to have_selector('.success')
    expect(page).to have_content('User 2 role ')
    expect(page).to have_link('User 2')
  end
end
