json.extract! presence, :id, :state, :player_id, :game_id, :created_at, :updated_at
json.url presence_url(presence, format: :json)
