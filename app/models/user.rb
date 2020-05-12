class User < ApplicationRecord
  belongs_to :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable, :lockable

  validates :full_name, :email, :password, :description, :role_id, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
end
