class Position < ApplicationRecord
  has_many :users
  
  validates :title, :description, :presence => true
  validates :title, :uniqueness => { :case_sensitive => false }
end
