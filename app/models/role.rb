class Role < ApplicationRecord
  has_many :users, :dependent => :delete_all

  validates :name, :presence => true
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :description, :presence => true
  validates :deletable, :inclusion => { :in => [ true, false],
                                        :message => 'requires true or false' }

  before_save :set_slug

  def to_param
    name.downcase.parameterize
  end

  def mandatory?
    ['power user', 'admin', 'employee'].include?(name.downcase)
  end

  private

  def set_slug
    self.slug = name.downcase.parameterize
  end
end
