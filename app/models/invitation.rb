class Invitation < ApplicationRecord
  belongs_to :referee
  belongs_to :game
end
