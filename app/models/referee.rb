class Referee < ApplicationRecord
    has_many :referee_sets
    has_many :games, through: :referee_sets
    has_many :referee_positions, through: :referee_sets
    has_many :invitations
    has_many :division_referees
    has_one_attached :photo
end
