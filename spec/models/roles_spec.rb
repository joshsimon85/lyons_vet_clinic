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
  end
end
