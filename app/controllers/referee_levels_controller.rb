class RefereeLevelsController < ApplicationController
  before_action :set_referee_level, only: %i[ show edit update destroy ]

  # GET /referee_levels or /referee_levels.json
  def index
    @referee_levels = RefereeLevel.all
  end

  # GET /referee_levels/1 or /referee_levels/1.json
  def show
  end

  # GET /referee_levels/new
  def new
    @referee_level = RefereeLevel.new
  end

  # GET /referee_levels/1/edit
  def edit
  end

  # POST /referee_levels or /referee_levels.json
  def create
    @referee_level = RefereeLevel.new(referee_level_params)

    respond_to do |format|
      if @referee_level.save
        format.html { redirect_to referee_level_url(@referee_level), notice: "Referee level was successfully created." }
        format.json { render :show, status: :created, location: @referee_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referee_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referee_levels/1 or /referee_levels/1.json
  def update
    respond_to do |format|
      if @referee_level.update(referee_level_params)
        format.html { redirect_to referee_level_url(@referee_level), notice: "Referee level was successfully updated." }
        format.json { render :show, status: :ok, location: @referee_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @referee_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referee_levels/1 or /referee_levels/1.json
  def destroy
    @referee_level.destroy

    respond_to do |format|
      format.html { redirect_to referee_levels_url, notice: "Referee level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee_level
      @referee_level = RefereeLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referee_level_params
      params.require(:referee_level).permit(:name)
    end
end
