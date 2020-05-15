class User < ApplicationRecord
  belongs_to :role
  belongs_to :position, :optional => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable, :lockable

  validates :full_name, :email, :password, :presence => true
  validates_with PositionIdValidator
  validates_with DescriptionValidator
  validates :email, :uniqueness => { :case_sensitive => false }

  def admin?
    role.name.downcase == 'admin'
  end

  def power_user?
    role.name.downcase == 'power user'
  end

  def privileged_user?
    admin? || power_user?
  end
end