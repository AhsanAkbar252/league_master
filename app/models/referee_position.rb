class RefereePosition < ApplicationRecord
    has_many :referee_sets
    has_many :referees, through: :referee_sets
    has_many :games, through: :referee_sets
    has_many :referee_pays
end
