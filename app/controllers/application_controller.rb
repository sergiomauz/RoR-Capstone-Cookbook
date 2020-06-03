class ApplicationController < ActionController::Base
  helper_method :current_user, :must_be_authenticated
  add_flash_types :error, :success
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def must_be_authenticated
    redirect_to root_path unless current_user
  end
end
