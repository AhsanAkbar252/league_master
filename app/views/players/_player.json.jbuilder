json.extract! player, :id, :first_name, :last_name, :email, :phone, :created_at, :updated_at
json.url player_url(player, format: :json)
