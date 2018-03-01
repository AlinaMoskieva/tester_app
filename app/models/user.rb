class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true

  has_many :tests, dependent: :destroy
  has_many :tasks, through: :tests
end
