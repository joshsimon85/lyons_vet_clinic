require 'rails_helper'

RSpec.describe Position do
  subject { build(:position) }
  
  it { should have_many(:users) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:description) }
end
