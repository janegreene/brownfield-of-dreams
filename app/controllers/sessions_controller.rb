class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Looks like your email or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
# from https://github.com/omniauth/omniauth
# def create
#   @user = User.find_or_create_from_auth_hash(auth_hash)
#   self.current_user = @user
#   redirect_to '/'
# end
#
# protected
#
# def auth_hash
#   request.env['omniauth.auth']
# end
