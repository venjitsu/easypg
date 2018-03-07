class EpgsController < ApplicationController
  before_action :set_epg, only: [:show, :edit, :update, :destroy]
  #GET /epgs/index
  def index
    @epgs = Epg.all
  end

  def destroy
    @epg.destroy
    respond_to do |format|
      format.html { redirect_to epgs_url, notice: 'Epg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # GET /epgs/new
  def new
    @epg = Epg.new
  end

  # POST /epgs
  # POST /epgs.json
  def create
    @epg = Epg.new(epg_params)

    respond_to do |format|
      if @epg.save
        format.html { redirect_to @epg, notice: 'Epg was successfully created.' }
        format.json { render :show, status: :created, location: @epg }
      else
        format.html { render :new }
        format.json { render json: @epg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /epgs/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @epg.update(epg_params)
        format.html { redirect_to @epg, notice: 'Epg was successfully updated.' }
        format.json { render :show, status: :ok, location: @epg }
      else
        format.html { render :edit }
        format.json { render json: @epg.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /epgs/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_epg
      @epg = Epg.find(params[:id])
    end


  def epg_params
    params.require(:epg).permit( :spreadsheet, :spreadsheet_cache )
  end

end
