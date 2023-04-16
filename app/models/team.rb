class Team < ApplicationRecord
  belongs_to :division
  has_many :team_players, dependent: :destroy
  has_many :players, through: :team_players
  has_many :goals, through: :players
  has_many :home_games, class_name: "Game", foreign_key: "home_team_id", dependent: :destroy
  has_many :away_games, class_name: "Game", foreign_key: "away_team_id", dependent: :destroy
  has_one_attached :photo
end
