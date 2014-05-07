class PhotosController < ApplicationController

  before_filter :signed_in_user, only: [:destroy]

  def index
    @event = Event.find(params[:event_id])
    @photos = @event.photos.all

    #creating a variable that will store all the info of each photos as an array(using the gon gem)
    gon.arrayPhotos = @event.photos.map do |photo|
      photo.image.url
    end
  end

  def show
    #all photos are nested under an event. To show a photo, first look up the event via the event_id. 
    @event = Event.find(params[:event_id])
    @photo = @event.photos.find(params[:id])
  end

  def new
    #same as show.
    @event = Event.find(params[:event_id])
    @photo = @event.photos.new
  end

  def create
    #when uploading a new photo, ensure that the photo has an event id.
    #First find the event that the photo is linked to (via the route used to upload photos)
    @event = Event.find(params[:event_id])
    #create a new photo 
    @photo = @event.photos.new photo_params
    #the if photo save, saves the photo if the above two lines run and redirect you to a page to view the individual photo, plus confirmation message.
    if @photo.save
      redirect_to event_photo_path(@event, @photo), notice: 'Your photo has been added!'
    #if save doesn't work, communicate it didn't work and redirect to upload page.
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
