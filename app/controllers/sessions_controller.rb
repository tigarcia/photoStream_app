class SessionsController < ApplicationController

  def new
  end

  def index
    ## The view that corresponds to this method seems a little out of
    ## place.  It may make sense to have a sitescontroller that just
    ## handles some basic pages that aren't authenticated.
  end

  def create 
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

    sign_in user
    redirect_to user

    else
      flash[:error]='Invalid email address/password combination'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
