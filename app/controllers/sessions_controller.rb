class SessionsController < ApplicationController
  def new
    if signed_in?  # if signed in, then redirect to root path
      redirect_to root_path
      return      
    end
    
  end

  def create
    if signed_in?  # if signed in, then redirect to root path
      redirect_to root_path
      return      
    end

    user = User.find_by_email(params[:session][:email]) 	
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path  	
  end
end
