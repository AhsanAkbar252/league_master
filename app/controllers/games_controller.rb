class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
    @home_team = @game.home_team
    @away_team = @game.away_team
    @home_team_goals = @home_team.goals.where(game_id: @game.id)
    @away_team_goals = @away_team.goals.where(game_id: @game.id)
    @home_team_players = @home_team.players
    @away_team_players = @away_team.players
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def game_dashboard
    @game = Game.find(params[:id])
    @home_team = @game.home_team
    @away_team = @game.away_team
    @home_team_players = @home_team.players
    @away_team_players = @away_team.players
    @goal = Goal.new
    @goals = @game.goals
    @yellow_card = YellowCard.new
    @yellow_cards = @game.yellow_cards
    @red_card = RedCard.new
    @red_cards = @game.red_cards
    @referee_set = RefereeSet.new
    @referee_sets = RefereeSet.where(game_id: @game.id)
  end


  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:date, :state, :venue_id, :home_team_id, :away_team_id)
    end
end
