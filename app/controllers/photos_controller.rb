class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: 'Your photo has been added!'
    else
      flash[:error]='Something went wrong. Please try again.'
      redirect_to new_photo_path
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image)
  end
end
