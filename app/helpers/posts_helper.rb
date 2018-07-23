module PostsHelper
  
  # redirects user if not logged in
  def require_log_in
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

end

