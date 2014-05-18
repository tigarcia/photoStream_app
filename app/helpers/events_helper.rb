module EventsHelper
  def check_event_owner
    ## Unfortunately this a small error that lead to a larger problem.
    ## The code you wrote will always return an array of results, so event
    ## will never be nil.  Therefore, this app does not do any authorization.
    ## params[:id] returns a string, and then you call
    ## first on that string which gets the first character of the string.
    ## For example:
    ##
    ## "abcdefg".first # returns a string "a"
    ##
    ## I think the code you wanted to have was the following:
    ##
    ## event = current_user.events.where(:id => params[:id]).first
    ## 
    event = current_user.events.where(:id => params[:id]).first
    if event.nil?
      flash[:error] = "Somthing is wrong. That's not your event."
      redirect_to events_path
    end
  end

end