class SessionsController < ApplicationController
  # GET Controller action.
  def new
  end

  # POST action creates a new session.
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome #{user.username}!"
      if user.physician?
        redirect_to search_index_path
      else
        redirect_to work_orders_path
      end
    else
      flash[:danger] = 'Invalid username/password combination.'
      render 'new'
    end
  end

  # DELETE action that removes the given session.
  def destroy
  end
end
