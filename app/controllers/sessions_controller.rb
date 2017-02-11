class SessionsController < ApplicationController
  # GET Controller action.
  def new
    render 'new', :layout => false
  end

  # POST action creates a new session.
  def create
    # user = User.find_by(username: params[:session][:username].downcase)
    user = User.new(session_params) 
    if (user.username == 'centro' && user.password == '2017')
      # user && user.authenticate(params[:session][:password])
      session[:id] = 1
      flash[:success] = "Bienvenido #{user.username}!"
      redirect_to people_path
    else
      flash[:danger] = 'Usuario/password incorrecto.'
      render 'new'
    end
  end

  # DELETE action that removes the given session.
  def destroy
    session[:id] = nil
    flash[:success] = 'Usuario desconectado.'
    redirect_to login_path
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.   
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
