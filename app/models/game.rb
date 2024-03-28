class Game < ApplicationRecord
  has_many :gamelogs
  has_many :users, through: :gamelogs
end
