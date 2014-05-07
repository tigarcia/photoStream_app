class PhotosController < ApplicationController

  before_filter :signed_in_user, only: [:destroy]

  def index
    @photos = Photo.all
  end

  def show
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new
  end

  def create

    # current_event = Event.find_by(id: params[:id])
    # photo = current_event.photo.create photo_params

    @event = Event.find(params[:event_id])
    @photo = @event.photos.new photo_params
    # @photo.event_id = current_user.event.find(params[:id])
    # @photo.save

    if @photo.save
      redirect_to event_photo_path(@event, @photo), notice: 'Your photo has been added!'
    else
      flash[:error]='Something went wrong. Please try again.'
      redirect_to new_event_photo_path
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
