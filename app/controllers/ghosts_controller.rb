class GhostsController < ApplicationController
  before_action :set_ghost, only: [:show, :edit, :update, :destroy]

  # GET /ghosts
  # GET /ghosts.json
  def index
    @ghosts = Ghost.all
  end

  # GET /ghosts/1
  # GET /ghosts/1.json
  def show
  end

  # GET /ghosts/new
  def new
    @ghost = Ghost.new
  end

  # GET /ghosts/1/edit
  def edit
  end

  # POST /ghosts
  # POST /ghosts.json
  def create
    @ghost = Ghost.new(ghost_params)

    respond_to do |format|
      if @ghost.save
        format.html { redirect_to @ghost, notice: 'Ghost was successfully created.' }
        format.json { render :show, status: :created, location: @ghost }
      else
        format.html { render :new }
        format.json { render json: @ghost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ghosts/1
  # PATCH/PUT /ghosts/1.json
  def update
    respond_to do |format|
      if @ghost.update(ghost_params)
        format.html { redirect_to @ghost, notice: 'Ghost was successfully updated.' }
        format.json { render :show, status: :ok, location: @ghost }
      else
        format.html { render :edit }
        format.json { render json: @ghost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ghosts/1
  # DELETE /ghosts/1.json
  def destroy
    @ghost.destroy
    respond_to do |format|
      format.html { redirect_to ghosts_url, notice: 'Ghost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ghost
      @ghost = Ghost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ghost_params
      params.require(:ghost).permit(:name)
    end
end
