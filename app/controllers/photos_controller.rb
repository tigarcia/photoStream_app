class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    #upload page for pictures
  end

  private
    def photo_params
      params.require(:photo).permit(:name)
  end
end
