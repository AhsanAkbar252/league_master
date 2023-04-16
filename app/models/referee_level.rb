class RefereeLevel < ApplicationRecord
    has_many :referee_pays
    has_many :division_referees
end
