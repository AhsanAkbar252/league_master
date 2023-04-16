json.extract! invitation, :id, :state, :referee_id, :game_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
