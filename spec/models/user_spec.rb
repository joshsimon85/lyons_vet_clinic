require 'rails_helper'

RSpec.describe User do
  let(:role) { build(:role) }
  subject { build(:user, :role => role) }
  
  it { should belong_to(:role) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:role_id) }
  it { should validate_uniqueness_of(:email).case_insensitive }
end
