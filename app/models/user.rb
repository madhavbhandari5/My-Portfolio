class User < ApplicationRecord
  has_many :resumes
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
