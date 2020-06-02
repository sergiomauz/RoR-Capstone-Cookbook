class UsersController < ApplicationController
  def index
    @page_title = 'SIGN IN'
  end

  def new
    @page_title = 'SIGN UP'
    @user = User.new
  end

  def create
    if !user_params[:image_file].nil?
      uploaded_file = Cloudinary::Uploader.upload(user_params[:image_file])
      @user = User.new(name: user_params[:name], username: user_params[:username], avatar: uploaded_file['secure_url'])
    else
      @user = User.new(name: user_params[:name], username: user_params[:username])
    end

    if @user.save
      flash[:notice] = 'You are signed up. Now you can sign in!'
      redirect_to root_path
    else      
      flash.now[:error] = @user.errors.full_messages.join('. | ').to_s
      render new_user_path
    end
  end

  def signin
    user = User.where(username: user_params[:username])[0]
    if user
      session[:user_id] = user.id
      redirect_to(root_path, notice: 'You are signed in!')
    else
      redirect_to(new_user_path, alert: 'Invalid username!. You must sign up to continue.')
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to(root_path, danger: 'You are signed out!')
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :avatar, :image_file)
  end
end
