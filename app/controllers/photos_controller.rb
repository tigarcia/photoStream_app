class PhotosController < ApplicationController

  before_filter :signed_in_user, only: [:destroy]

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
    # @photo = Photo.new(photo_params)
    photo = current_user.event.photo.create photo_params

    if @photo.save
      redirect_to @photo, notice: 'Your photo has been added!'
    else
      flash[:error]='Something went wrong. Please try again.'
      redirect_to new_photo_path
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.delete
    redirect_to photos_path
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :image)
  end
end
