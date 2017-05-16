class AppliesController < ApplicationController
  before_action :set_apply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :create, :close]

  # GET /applies
  # GET /applies.json
  def index
    @applies = Apply.all
  end

  # GET /applies/new
  def new
    @apply = Apply.new
  end

  # POST /applies
  # POST /applies.json
  def create
    @apply = Apply.new(apply_params)

    respond_to do |format|
      if @apply.save
        format.html { redirect_to '/close' }
        format.json { render :show, status: :created, location: @apply}
      else
        format.html { render :new }
        format.json { render json: @apply.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def close
  end

  # DELETE /applies/1
  # DELETE /applies/1.json
  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to applies_url, notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply
      @apply = Apply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_params
      params.require(:apply).permit(:auclub_id, :name, :phone)
    end
end
