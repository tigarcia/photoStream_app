class EventsController < ApplicationController
  include EventsHelper

  before_filter :signed_in_user
  before_filter :check_event_owner, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.create event_params
  
    if event.save
      ## To ensure you don't make any mistakes, it would be good to use the
      ## path helper methods.  In this case, you are redirecting to events_path
      redirect_to '/events'
    else
      flash[:error] = "That event name already exits. Please enter a unique name."
      ## Use event helpers, new_event_path
      redirect_to '/events/new'
    end
  end

  def index
    @events = current_user.events 
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id])
    event.delete
    ## Make sure to use helpers, events_path
    redirect_to '/events'
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes event_params
    redirect_to(event)
  end

  private
    def event_params
      params.require(:event).permit(:name, :event_date, :user_id)
  end

end