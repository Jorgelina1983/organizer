module SessionsHelper
	# Returns true if the user is logged in, false otherwise.
  def logged_in?
    session[:id] = 1
  end
end
