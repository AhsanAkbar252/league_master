class RefereePaysController < ApplicationController
  before_action :set_referee_pay, only: %i[ show edit update destroy ]

  # GET /referee_pays or /referee_pays.json
  def index
    @referee_pays = RefereePay.all
  end

  # GET /referee_pays/1 or /referee_pays/1.json
  def show
  end

  # GET /referee_pays/new
  def new
    @referee_pay = RefereePay.new
  end

  # GET /referee_pays/1/edit
  def edit
  end

  # POST /referee_pays or /referee_pays.json
  def create
    @referee_pay = RefereePay.new(referee_pay_params)

    respond_to do |format|
      if @referee_pay.save
        format.html { redirect_to referee_pay_url(@referee_pay), notice: "Referee pay was successfully created." }
        format.json { render :show, status: :created, location: @referee_pay }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @referee_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referee_pays/1 or /referee_pays/1.json
  def update
    respond_to do |format|
      if @referee_pay.update(referee_pay_params)
        format.html { redirect_to referee_pay_url(@referee_pay), notice: "Referee pay was successfully updated." }
        format.json { render :show, status: :ok, location: @referee_pay }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @referee_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referee_pays/1 or /referee_pays/1.json
  def destroy
    @referee_pay.destroy

    respond_to do |format|
      format.html { redirect_to referee_pays_url, notice: "Referee pay was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referee_pay
      @referee_pay = RefereePay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referee_pay_params
      params.require(:referee_pay).permit(:amount, :referee_position_id, :referee_level_id)
    end
end
