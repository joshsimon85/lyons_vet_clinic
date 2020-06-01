require 'rails_helper'

RSpec.describe Position do
  subject { build(:position) }

  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:description) }
end
