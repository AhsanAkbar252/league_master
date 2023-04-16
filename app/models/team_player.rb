class TeamPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :team
  has_many :goals, through: :player
end
