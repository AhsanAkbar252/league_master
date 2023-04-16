class Game < ApplicationRecord
  belongs_to :venue
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :referee_sets, dependent: :destroy
  has_many :referees, through: :referee_sets
  has_many :referee_positions, through: :referee_sets
  has_many :yellow_cards, dependent: :destroy
  has_many :red_cards, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :presences, dependent: :destroy
  has_many :invitations,  dependent: :destroy
end
