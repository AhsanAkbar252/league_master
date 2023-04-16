Rails.application.routes.draw do
  resources :team_players
  root to: 'welcome#home'
  resources :invitations
  resources :referee_pays
  resources :presences
  resources :goals
  resources :red_cards
  resources :yellow_cards
  resources :referee_levels
  resources :referee_positions
  resources :games
  resources :referees
  resources :venues
  resources :players
  resources :teams
  resources :divisions
  resources :leagues
  resources :referee_sets
  get "/game_dashboard/:id", to: "games#game_dashboard", as: "game_dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
