class User < ApplicationRecord
  has_many :gamelogs
  has_many :games, through: :gamelogs
end
