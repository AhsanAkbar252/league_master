class League < ApplicationRecord
has_many :divisions, dependent: :destroy
has_one_attached :photo
end
