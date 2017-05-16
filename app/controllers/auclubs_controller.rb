class AuclubsController < ApplicationController
  before_action :set_auclub, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:index]
  
  # GET /auclubs
  # GET /auclubs.json
  def index
    @auclubs = Auclub.all
    @yschedules = Yschedule.all
    @recipes = Auclub.all

    
    #검색어 query에 저장
    query = params[:query]
    p query 
    
    if params[:search]
             @recipes = Auclub.search(params[:search]).order("created_at DESC")
                  else
        @recipes = Auclub.all.order("created_at DESC")
    end
  end
   

  # GET /auclubs/1
  # GET /auclubs/1.json
  def show
  end

  # GET /auclubs/new
  def new
    @auclub = Auclub.new
    @yschedules = []
    4.times do
        @yschedules << Yschedule.new
    end
  end

  # GET /auclubs/1/edit
  def edit
  end

  # POST /auclubs
  # POST /auclubs.json
  def create
    @auclub = Auclub.new(auclub_params)
    # @yschedule = Yschedule.new
    @period = params[:period]
    @content = params[:content]
    @auclub_id = params[:auclub_id]
    
    p @period
    p @content
    p @auclub_id
    
    respond_to do |format|
      if @auclub.save 
        format.html { redirect_to @auclub, notice: 'Auclub was successfully created.' }
        format.json { render :show, status: :created, location: @auclub }
      else
        format.html { render :new }
        format.json { render json: @auclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auclubs/1
  # PATCH/PUT /auclubs/1.json
  def update
    respond_to do |format|
      if @auclub.update(auclub_params)
        format.html { redirect_to @auclub, notice: 'Auclub was successfully updated.' }
        format.json { render :show, status: :ok, location: @auclub }
      else
        format.html { render :edit }
        format.json { render json: @auclub.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auclubs/1
  # DELETE /auclubs/1.json
  def destroy
    @auclub.destroy
    respond_to do |format|
      format.html { redirect_to auclubs_url, notice: 'Auclub was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auclub
      @auclub = Auclub.find(params[:id])
      @yschedules = Yschedule.where('auclub_id = ?', params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auclub_params
      params.require(:auclub).permit(:name, :introduce, :description, :apply_time, :meeting_time, :tel, :logo, :category)
    end
    # def yschedule_params
    #   params.require(:yschedule).permit(:period, :content, :auclub_id)
    # end
end
