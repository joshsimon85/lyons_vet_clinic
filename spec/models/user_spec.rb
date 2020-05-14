require 'rails_helper'

RSpec.describe User do
  let(:role) { create(:role) }
  subject { build(:user, :role => role) }

  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  describe 'users belongs to a role' do
    it 'has a role id assigned' do
      role =  create(:role, :name => 'admin')
      position =  create(:position)
      admin = create(:user, :role => role, :position => position)

      expect(User.first.role_id).to eq(role.id)
    end
  end

  describe 'employees and admins' do
    context 'role is admin' do
      let(:role) { create(:role, :name => 'admin') }
      let(:position) { create(:position) }
      let!(:admin) { create(:user, :role => role, :position => position) }

      it 'requires a position id to be valid' do
        expect(User.count).to eq(1)
        expect(User.first.position_id).to eq(position.id)
      end

      it 'requires a description' do
        expect(User.first.description).to be_present
      end
    end

    context 'role is admin and position_id is nil' do
      let(:role) { create(:role, :name => 'admin') }

      it 'raises an error and does not create the record' do
        expect{ create(:user, :role => role) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'role is admin and descripton is nil' do
      let(:role) { create(:role, :name => 'admin') }
      let(:position) { create(:position) }

      it 'raises an error and does not create the record' do
        expect{ create(:user, { :role => role,
                                :position => position,
                                :description => nil }) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'role is employee' do
      let(:role) { create(:role, :name => 'employee') }
      let(:position) { create(:position) }
      let!(:employee) { create(:user, :role => role, :position => position) }

      it 'has belongs to a position' do
        expect(User.first.position_id).to eq(position.id)
      end
    end

    context 'role is employee and description is nil' do
      let(:role) { create(:role, :name => 'employee') }
      let(:position) { create(:position) }

      it 'raises an exception and does not create the record' do
        expect{ create(:user, { :role => role,
                                :position => position,
                                :description => nil }) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'role is employee and position_id is nil' do
      let(:role) { create(:role, :name => 'eMployeE') }

      it 'raises an exception and does not create the record' do
        expect{ create(:user, { :role => role }) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    context 'role is employee or admin case insensitive' do
        it 'creates the record when role is AdMin' do
          role = create(:role, :name => 'AdMin')
          position = create(:position)
          admin = create(:user, { :role => role, :position => position })

          expect(User.count).to eq(1)
          expect(User.first.full_name).to eq(admin.full_name)
        end

        it 'creates the record when role is emPloyEE' do
          role = create(:role, :name => 'emPloyEE')
          position = create(:position)
          admin = create(:user, { :role => role, :position => position })

          expect(User.count).to eq(1)
          expect(User.first.full_name).to eq(admin.full_name)
        end
    end
  end

  describe 'users other than admin and employees' do
    context 'role is user' do
      let(:role) { create(:role, :name => 'user') }
      let!(:jane) { create(:user, { :role => role, :description => nil }) }

      it 'does not have belongs to relationship with position' do
        expect(User.first.position_id).not_to be_present
      end

      it 'does not require a description' do
        expect(User.first.description).not_to be_present
      end
    end
  end
end
