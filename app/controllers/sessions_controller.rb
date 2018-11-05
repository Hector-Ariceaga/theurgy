class SessionsController < ApplicationController
  before_action :already_logged_in?, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Incorrect username or password."
      render 'new'
    end
  end

  def create_facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = SecureRandom.urlsafe_base64
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
