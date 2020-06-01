class Position < ApplicationRecord
  has_many :users

  validates :name, :description, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }

  before_save :set_slug

  def to_param
    name.downcase.parameterize
  end
  
  private

  def set_slug
    self.slug = name.downcase.parameterize
  end
end
