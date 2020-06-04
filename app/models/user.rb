class User < ApplicationRecord
  belongs_to :role
  belongs_to :position, :optional => true
  has_one :profile_image

  default_scope { order(full_name: "ASC") }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable, :lockable

  validates :full_name, :password, :presence => true
  validates :email, :presence => true, :format => { :with => /\A.+@.+\z/,
    :message => 'must be properly formatted' }
  validates :email, :uniqueness => { :case_sensitive => false }
  validates_with PositionIdValidator
  validates_with DescriptionValidator

  before_save :set_slug

  def admin?
    role.name.downcase == 'admin'
  end

  def power_user?
    role.name.downcase == 'power user'
  end

  def privileged_user?
    admin? || power_user?
  end

  def to_param
    full_name.downcase.parameterize
  end

  private

  def set_slug
    self.slug = full_name.downcase.parameterize
  end
end
