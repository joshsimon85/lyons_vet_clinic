require 'rails_helper'

describe 'CRUD role actions' do
  let(:jon) { create_admin! }

  before :each do
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

  scenario 'creating a new invalid role from roles#new', :js => true do
    visit new_role_path

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the role.')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('prevented your role from being created')
  end

  scenario 'updating a role with invalid feilds', :js => true do
    create_role!

    visit roles_path

    click_link 'admin'
    click_link 'Edit Admin'

    fill_in 'Name', :with => ''

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error updating the role.')
    expect(page).to have_content('prevented your role from being updated')
    expect(page).to have_content("Name can't be blank")
  end
end
