class UsersController < ApplicationController
  def index
    @a = 1 + 3
    p "Hello " + @a.to_s
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :avatar)
  end  
end
