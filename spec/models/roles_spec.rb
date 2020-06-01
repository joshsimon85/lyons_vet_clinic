require 'rails_helper'

RSpec.describe Role do
  subject { create(:role) }

  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:description) }

  describe 'validates deletable attribute' do
    it 'is valid with a false value' do
      role = build(:role, :deletable => false)
      expect(role.valid?).to be(true)
    end

    it 'is valid with a true value' do
      role = build(:role, :deletable => true)
      expect(role.valid?).to be(true)
    end

    it 'is raises an error when it is a nil value' do
      expect{ create(:role, :deletable => nil) }
        .to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'sets a slug' do
      role = create(:role, :name => 'power user')
      expect(role.slug).to eq('power-user')
    end

    it 'sets a the slug to the paramatized downcase of the name' do
      role = create(:role, :name => 'Power UsEr')
      expect(role.slug).to eq('power-user')
    end
  end

  describe '#mandatory?' do
    it 'returns false when role name is power user' do
      role = create(:role, :name => 'power user')

      expect(role.mandatory?).to be(true)
    end

    it 'returns false when role name is admin' do
      role = create(:role, :name => 'admin')

      expect(role.mandatory?).to be(true)
    end

    it 'returns false when role name is employee' do
      role = create(:role, :name => 'employee')

      expect(role.mandatory?).to be(true)
    end

    it 'returns false when role name is admin case insensitive' do
      role = create(:role, :name => 'AdmiN')

      expect(role.mandatory?).to be(true)
    end

    it 'returns true when role is not admin/power user/employee' do
      role = create(:role, :name => 'tech')

      expect(role.mandatory?).to be(false)
    end
  end
end
