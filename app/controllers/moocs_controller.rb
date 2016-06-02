class MoocsController < ApplicationController

  def index
  end

  def new
    @mooc = Mooc.new
  end

  def create
    @mooc = Mooc.create!(mooc_params)
    redirect_to admin2_videos_path
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def mooc_params
    params.require(:mooc).permit(:title)
  end
end
