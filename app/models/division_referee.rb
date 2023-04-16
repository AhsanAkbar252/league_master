class DivisionReferee < ApplicationRecord
  belongs_to :referee_level
  belongs_to :division
  belongs_to :referee
end
