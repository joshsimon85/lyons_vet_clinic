class Role < ApplicationRecord
  has_many :users
  
  validates :name, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :description, :presence => true
end
