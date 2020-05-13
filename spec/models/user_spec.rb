require 'rails_helper'

RSpec.describe User do
  let(:role) { create(:role) }
  subject { build(:user, :role => role) }

  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  describe 'user belongs to a role' do
    it 'has a role id assigned' do
      role =  create(:role, :name => 'admin')
      position =  create(:position)
      admin = create(:user, :role => role, :position => position)

      expect(User.first.role_id).to eq(role.id)
    end
  end

  describe 'user belongs to a position' do
    context 'user role is admin' do
      let(:role) { create(:role, :name => 'admin') }
      let(:position) { create(:position) }
      let!(:admin) { create(:user, :role => role, :position => position) }

      it 'has belongs to relationship with position' do
        expect(User.first.position_id).to eq(position.id)
      end
    end

    context 'user role is power user' do
      let(:role) { create(:role, :name => 'power user') }
      let(:position) { create(:position) }
      let!(:admin) { create(:user, :role => role, :position => position) }


      it 'has belongs to relationship with position' do
        expect(User.first.position_id).to eq(position.id)
      end
    end

    context 'user role is power user case insensitve' do
      let(:role) { create(:role, :name => 'Power usEr') }
      let(:position) { create(:position) }
      let!(:admin) { create(:user, :role => role, :position => position) }

      it 'has belongs to relationship with position' do
        expect(User.first.position_id).to eq(position.id)
      end
    end

    context 'user role is power user and position_id is nil' do
      let(:role) { create(:role, :name => 'power user') }
      let!(:admin) { build(:user, :role => role) }

      it 'does not pass validations' do
        expect(admin.valid?).to eq(false)
        expect(User.count).to eq(0)
      end
    end

    context 'user role in not admin' do
      let(:role) { create(:role, :name => 'user') }
      let!(:jane) { create(:user, :role => role) }

      it 'does not have belongs to relationship with position' do
        expect(User.first.position_id).to eq(nil)
      end
    end
  end
end
