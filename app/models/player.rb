class Player < ApplicationRecord
    has_one_attached :photo
    has_many :team_players
    has_many :teams, through: :team_players
    has_many :yellow_cards
    has_many :red_cards
    has_many :goals
    has_many :presences
    has_many :teams, through: :team_players
end
