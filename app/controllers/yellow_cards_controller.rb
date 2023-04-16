class YellowCardsController < ApplicationController
  before_action :set_yellow_card, only: %i[ show edit update destroy ]

  # GET /yellow_cards or /yellow_cards.json
  def index
    @yellow_cards = YellowCard.all
  end

  # GET /yellow_cards/1 or /yellow_cards/1.json
  def show
  end

  # GET /yellow_cards/new
  def new
    @yellow_card = YellowCard.new
  end

  # GET /yellow_cards/1/edit
  def edit
  end

  # POST /yellow_cards or /yellow_cards.json
  def create
    @yellow_card = YellowCard.new(yellow_card_params)

    respond_to do |format|
      if @yellow_card.save
        format.html { redirect_to game_dashboard_path(@yellow_card.game), notice: "Yellow card was successfully created." }
        format.json { render :show, status: :created, location: @yellow_card }
      else
        format.html { redirect_to game_dashboard_path(@yellow_card.game), notice: "Yellow card cannot be added" }
        format.json { render json: @yellow_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yellow_cards/1 or /yellow_cards/1.json
  def update
    respond_to do |format|
      if @yellow_card.update(yellow_card_params)
        format.html { redirect_to game_dashboard_path(@yellow_card.game), notice: "Yellow card was successfully updated." }
        format.json { render :show, status: :ok, location: @yellow_card }
      else
        format.html { redirect_to game_dashboard_path(@yellow_card.game), notice: "Yellow card cannot be added" }
        format.json { render json: @yellow_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yellow_cards/1 or /yellow_cards/1.json
  def destroy
    @yellow_card.destroy

    respond_to do |format|
      format.html { redirect_to yellow_cards_url, notice: "Yellow card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yellow_card
      @yellow_card = YellowCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def yellow_card_params
      params.require(:yellow_card).permit(:time, :player_id, :game_id)
    end
end
