require 'rails_helper'

RSpec.describe UserDecorator do
  let(:power_user_role) { create(:role, :name => 'power user',
                            :description => 'power user') }
  let(:user_role) { create(:role, :name => 'user', :description => 'user') }

  let(:position) { create(:position, :name => 'info tech', :description => ' it ') }

  let(:power_user) { create(:user,
    :full_name => ' jon   doe ',
    :email => ' jon@doe.com ',
    :password => 'password',
    :position => position,
    :role => power_user_role
  )}

  let(:user) { create(:user,
    :full_name => 'jane doe',
    :description => nil,
    :email => ' jane@doe.com ',
    :password => 'password',
    :role => user_role,
  )}

  let(:jon) { UserDecorator.new(power_user) }
  let(:jane) { UserDecorator.new(user) }

  describe '#name' do
    it 'returns a formatted representation of the name' do
      expect(jon.name).to eq('Jon Doe')
    end
  end

  describe '#internal_employee?' do
    it 'returns true if the user has a position' do
      expect(jon.internal_employee?).to be(true)
    end

    it 'returns false if the user does not have a position' do
      expect(jane.internal_employee?).to be(false)
    end
  end

  describe '#position_description' do
    it 'returns a capitalized version of the description of the users position' do
      expect(jon.position_description).to eq(format_string(position.description))
    end

    it 'returns an empty string when the user has no position' do
      expect(jane.position_description).to eq('')
    end
  end

  describe '#title' do
    it 'returns a capitalized version of the users position name' do
      expect(jon.title).to eq(format(power_user.position.name))
    end

    it 'returns an empty string if the user does not have a position' do
      expect(jane.title).to eq('')
    end
  end

  describe '#role' do
    it 'returns the formatted name of the users role' do
      expect(jon.role).to eq(format(power_user.role.name))
    end
  end

  describe '#email' do
    it 'returns the users email address without leading or trailing white space' do
      expect(jon.email).to eq(power_user.email.strip)
    end
  end

  describe '#about' do
    it 'returns the users description capitalized and stripped of white space' do
      expect(jon.about).to eq(format_string(power_user.description))
    end

    it 'returns an empty string if the user does not have a description' do
      expect(jane.about).to eq('')
    end
  end

  describe '#model' do
    it 'returns the original model that was passed it' do
      jon = UserDecorator.new(power_user)

      expect(jon.model).to be(power_user)
    end
  end

  private

  def format(str)
    str.split.map { |str| str.capitalize.strip }.join(' ')
  end

  def format_string(str)
    str.strip[0].capitalize + str.strip[1..-1]
  end
end
