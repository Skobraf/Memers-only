class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)

    if user && user.authenticate(params[:sessions][:password])
      #login and redirect
      log_in(user)
      params[:sessions][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      #show message
      flash.now[:danger] = 'Invalid Email/Password Combination'
      render 'new'
    end 

  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

  def whitelist_params
  end
end
