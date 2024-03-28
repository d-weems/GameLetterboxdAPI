class User < ApplicationRecord
  has_secure_password

  has_many :gamelogs
  has_many :games, through: :gamelogs
end
