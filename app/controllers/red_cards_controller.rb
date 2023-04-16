class RedCardsController < ApplicationController
  before_action :set_red_card, only: %i[ show edit update destroy ]

  # GET /red_cards or /red_cards.json
  def index
    @red_cards = RedCard.all
  end

  # GET /red_cards/1 or /red_cards/1.json
  def show
  end

  # GET /red_cards/new
  def new
    @red_card = RedCard.new
  end

  # GET /red_cards/1/edit
  def edit
  end

  # POST /red_cards or /red_cards.json
  def create
    @red_card = RedCard.new(red_card_params)

    respond_to do |format|
      if @red_card.save
        format.html { redirect_to game_dashboard_path(@red_card.game), notice: "Red card was successfully created." }
        format.json { render :show, status: :created, location: @red_card }
      else
        format.html { redirect_to game_dashboard_path(@red_card.game), notice: "Red card cannot be added." }
        format.json { render json: @red_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /red_cards/1 or /red_cards/1.json
  def update
    respond_to do |format|
      if @red_card.update(red_card_params)
        format.html { redirect_to game_dashboard_path(@red_card.game), notice: "Red card was successfully updated." }
        format.json { render :show, status: :ok, location: @red_card }
      else
        format.html { redirect_to game_dashboard_path(@red_card.game), notice: "Red card cannot be added." }
        format.json { render json: @red_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /red_cards/1 or /red_cards/1.json
  def destroy
    @red_card.destroy

    respond_to do |format|
      format.html { redirect_to red_cards_url, notice: "Red card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_red_card
      @red_card = RedCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def red_card_params
      params.require(:red_card).permit(:time, :player_id, :game_id)
    end
end
