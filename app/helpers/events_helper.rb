module EventsHelper
  def check_event_owner
    event = current_user.events.where(:id => params[:id].first)
    if event.nil?
      flash[:error] = "Somthing is wrong. That's not your event."
      redirect_to events_path
    end
  end

  # def establish_event_owner
  #   @current_event = current_user.events.where(:id => params[:id].first)
  #   puts "current event #{@current_event}"
  # end
  # def current_event=(event)
  #   @current_event = event
  # end 

  # def current_event
  #   @current_event ||= Event.find_by(:)
  # end

end