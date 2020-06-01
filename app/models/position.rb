class Position < ApplicationRecord
  has_many :users

  validates :title, :description, :presence => true
  validates :title, :uniqueness => { :case_sensitive => false }

  before_save :set_slug

  private

  def set_slug
    self.slug = title.downcase.parameterize
  end
end
