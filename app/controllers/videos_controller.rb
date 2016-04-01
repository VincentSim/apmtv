class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => ENV["login"], :password => ENV["mdp"], only: [:admin, :admin2, :edit, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  def admin
    @videos = []
    ACCOUNT.videos.each do |video|
      @videos << video unless Video.find_by youtube_id: video.id
    end
    @video = Video.new
  end

  def admin2
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @url = '//www.youtube.com/embed/'+@video.youtube_id
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.youtube_id = video_params[:url].match(/[v][=][-]?\w+[-]?\w+/i)[0][2..12] if video_params[:url]
    binding.pry
    respond_to do |format|
      if @video.save
        format.js
        format.html
        format.json { render :show, status: :created, location: @video }

      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to admin2_videos_path, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:youtube_id, :title, :url, :description,:expert, :category, :subcategory, :date, :tag)
    end
end
