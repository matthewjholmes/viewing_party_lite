class User < ApplicationRecord
  has_many :parties
  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, uniqueness: true
  validates_presence_of :email, :name

  has_secure_password

end
