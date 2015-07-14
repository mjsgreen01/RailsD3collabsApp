class SongInvolvementsController < ApplicationController
  before_action :set_song_involvement, only: [:show, :edit, :update, :destroy]

  # GET /song_involvements
  # GET /song_involvements.json
  def index
    @song_involvements = SongInvolvement.all
  end

  # GET /song_involvements/1
  # GET /song_involvements/1.json
  def show
  end

  # GET /song_involvements/new
  def new
    @song_involvement = SongInvolvement.new
  end

  # GET /song_involvements/1/edit
  def edit
  end

  # POST /song_involvements
  # POST /song_involvements.json
  def create
    @song_involvement = SongInvolvement.new(song_involvement_params)

    respond_to do |format|
      if @song_involvement.save
        format.html { redirect_to @song_involvement, notice: 'Song involvement was successfully created.' }
        format.json { render :show, status: :created, location: @song_involvement }
      else
        format.html { render :new }
        format.json { render json: @song_involvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_involvements/1
  # PATCH/PUT /song_involvements/1.json
  def update
    respond_to do |format|
      if @song_involvement.update(song_involvement_params)
        format.html { redirect_to @song_involvement, notice: 'Song involvement was successfully updated.' }
        format.json { render :show, status: :ok, location: @song_involvement }
      else
        format.html { render :edit }
        format.json { render json: @song_involvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_involvements/1
  # DELETE /song_involvements/1.json
  def destroy
    @song_involvement.destroy
    respond_to do |format|
      format.html { redirect_to song_involvements_url, notice: 'Song involvement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_involvement
      @song_involvement = SongInvolvement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_involvement_params
      params.require(:song_involvement).permit(:song_id, :artist_id, :primary, :featured, :producer)
    end
end
