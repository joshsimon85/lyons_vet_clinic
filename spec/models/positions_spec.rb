require 'rails_helper'

RSpec.describe Position do
  subject { build(:position) }

  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:description) }

  it 'should return the records in alphabetic order A-Z based on name' do
    vet_tech = create(:position, :name => 'Vet Tech')
    vet = create(:position, :name => 'Vet')
    manager = create(:position, :name => 'Manager')

    expect(Position.all).to eq([manager, vet, vet_tech])
  end

  it 'sets a slug when a position is created' do
    create(:position, :name => 'test ing')

    expect(Position.first.slug).to be_present
    expect(Position.first.slug).to eq('test ing'.parameterize)
  end

  it 'updates the slug name when a position name is updated' do
    create(:position, :name => 'test')

    slug = Position.find_by(:name => 'test').slug
    Position.find_by(:name => 'test').update(:name => 'testing')

    expect(Position.find_by(:name => 'testing').slug).not_to eq(slug)
  end
end
