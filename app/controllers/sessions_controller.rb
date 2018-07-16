class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)

    if user && user.authenticate(params[:sessions][:password])
      #login and redirect
      log_in(user)
      remember user
      redirect_to user
    else
      #show message
      flash.now[:danger] = 'Invalid Email/Password Combination'
      render 'new'
    end 

  end

  private

  def whitelist_params
  end
end
