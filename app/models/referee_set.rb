class RefereeSet < ApplicationRecord
  belongs_to :referee_position
  belongs_to :referee
  belongs_to :game
end
