module EventsHelper
  def check_event_owner
    event = current_user.event.where(:id => params[:id].first)
    if recipe.nil?
      flash[:error] = "That's not your event."
      redirect_to events_path
    end
  end
end