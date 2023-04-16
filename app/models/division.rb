class Division < ApplicationRecord
  belongs_to :league
  has_many :teams, dependent: :destroy
  has_many :division_referees, dependent: :destroy
  has_one_attached :photo
end
