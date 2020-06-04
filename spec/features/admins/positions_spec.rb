require 'rails_helper'

describe 'CRUD role actions' do
  let(:jon) { create_admin! }

  before  do
    sign_in(jon)
  end

  scenario 'creating a new invalid position from positions#index', :js => true do
    visit positions_path

    click_link 'Create A New Position'
    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the position.')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('prevented your position from being created')
  end

  scenario 'creating a new valid position from positions#index', :js => true do
    visit positions_path

    click_link 'Create A New Position'
    fill_in 'Name', :with => 'Power User'
    fill_in 'Description', :with => 'External User'
    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The position has been successfully created.')
    expect(page).to have_current_path(positions_path)
  end

  scenario 'creating a new valid position from the positions new path', :js => true do
    visit new_role_path

    fill_in 'Name', :with => 'Power User'
    fill_in 'Description', :with => 'External User'
    click_button 'Submit'

    expect(page).to have_selector('.success')
    expect(page).to have_content('The role has been successfully created.')
    expect(page).to have_current_path(roles_path)
  end

  scenario 'creating a new invalid position from positions#new', :js => true do
    visit new_position_path

    click_button 'Submit'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error creating the position.')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content('prevented your position from being created')
  end

  scenario 'updating a position with invalid feilds', :js => true do
    create(:position, :name => 'vet tech')

    visit positions_path

    click_link 'Vet Tech'
    click_link 'Edit Vet Tech'
    fill_in 'Name', :with => ''
    click_button 'Update'

    expect(page).to have_selector('.error')
    expect(page).to have_content('There was an error updating ')
    expect(page).to have_content('prevented your position from being updated')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'updating a role with valid feilds', :js => true do
    create(:position, :name => 'vet tech')

    visit positions_path

    click_link 'Vet Tech'
    click_link 'Edit Vet Tech'
    fill_in 'Name', :with => 'vet'
    click_button 'Update'

    expect(page).to have_selector('.success')
    expect(page).to have_content('vet has been ')
    expect(page).to have_link('Vet')
  end
end
