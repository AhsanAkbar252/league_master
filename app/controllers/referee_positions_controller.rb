class RefereePositionsController < ApplicationController
  before_action :set_referee_position, only: %i[ show edit update destroy ]

  # GET /referee_positions or /referee_positions.json
  def index
    @referee_positions = RefereePosition.all
  end

  # GET /referee_positions/1 or /referee_positions/1.json
  def show
  end

  # GET /referee_positions/new
  def new
    @referee_position = RefereePosition.new
  end

  # GET /referee_positions/1/edit
  def edit
  end

  # POST /referee_positions or /referee_positions.json
  def create
    @referee_position = RefereePosition.new(referee_position_params)

    respond_to do |format|
      if @referee_position.save
        format.html { redirect_to referee_position_url(@referee_position), notice: "Referee position was successfully created." }
        format.json { render :show, status: :created, location: @referee_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referee_positions/1 or /referee_positions/1.json
  def update
    respond_to do |format|
      if @referee_position.update(referee_position_params)
        format.html { redirect_to referee_position_url(@referee_position), notice: "Referee position was successfully updated." }
        format.json { render :show, status: :ok, location: @referee_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @referee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referee_positions/1 or /referee_positions/1.json
  def destroy
    @referee_position.destroy

    respond_to do |format|
      format.html { redirect_to referee_positions_url, notice: "Referee position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee_position
      @referee_position = RefereePosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referee_position_params
      params.require(:referee_position).permit(:name)
    end
end
