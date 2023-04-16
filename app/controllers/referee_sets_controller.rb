class RefereeSetsController < ApplicationController
    before_action :set_referee_set, only: %i[ show edit update destroy ]
  
    # GET /referee_sets or /referee_sets.json
    def index
      @referee_sets = RefereeSet.all
    end
  
    # GET /referee_sets/1 or /referee_sets/1.json
    def show
    end
  
    # GET /referee_sets/new
    def new
      @referee_set = RefereeSet.new
    end
  
    # GET /referee_sets/1/edit
    def edit
    end
  
    # POST /referee_sets or /referee_sets.json
    def create
      @referee_set = RefereeSet.new(referee_set_params)
  
      respond_to do |format|
        if @referee_set.save
          format.html { redirect_to game_dashboard_path(@referee_set.game), notice: "Red card was successfully created." }
          format.json { render :show, status: :created, location: @referee_set }
        else
          format.html { redirect_to game_dashboard_path(@referee_set.game) }
          format.json { render json: @referee_set.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /referee_sets/1 or /referee_sets/1.json
    def update
      respond_to do |format|
        if @referee_set.update(referee_set_params)
          format.html { redirect_to game_dashboard_path(@referee_set.game), notice: "Red card was successfully updated." }
          format.json { render :show, status: :ok, location: @referee_set }
        else
          format.html { redirect_to game_dashboard_path(@referee_set.game) }
          format.json { render json: @referee_set.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /referee_sets/1 or /referee_sets/1.json
    def destroy
      @referee_set.destroy
  
      respond_to do |format|
        format.html { redirect_to game_dashboard_path(@referee_set.game), notice: "Red card was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_referee_set
        @referee_set = RefereeSet.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def referee_set_params
        params.require(:referee_set).permit(:referee_id, :referee_position_id, :game_id)
      end
  end
  