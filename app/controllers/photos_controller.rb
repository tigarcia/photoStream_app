class PhotosController < ApplicationController
  respond_to :json

  before_filter :signed_in_user, only: [:destroy]

  def index
    event_id 
    @photos = @event.photos

   #using map to create an array that holds the image urls
    arrayPhotos = @event.photos.map do |photo|
      ## watch out for spacing
        photo.image.url
    end

    ## Since you are using ajax to get your data, I don't think you need
    ## to use gon here at all.

    #storing array to pass into javascript
    gon.arrayPhotos = arrayPhotos
    #storing the event id
    gon.eventId = @event.id
    #storing url 
    gon.url = event_photos_path + ".json"
    #implementing JSON instead of using gon for displaying photos
    respond_with(arrayPhotos) do |format|
      format.html {render "index"}
      format.json {render json: arrayPhotos.as_json}
    #event.photos.order
    end
  end

  def show
    #all photos are nested under an event. To show a photo, first look up the event via the event_id. 

    ## You can just add a before_action that calls event_id for you instead of writing
    ## it at the top of each method
    event_id 
    @photo = @event.photos.find(params[:id])
  end

  def new
    ## same as show.
    event_id
    @photo = @event.photos.new
  end

  def create
    #when uploading a new photo, ensure that the photo has an event id.
    #First find the event that the photo is linked to (via the route used to upload photos)
    event_id
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

    ## I like this.
    # new method to DRY up code.
    def event_id 
      # spacing is off
       @event = Event.find(params[:event_id])
    end
end
