class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing up."
      redirect_to '/sign_up'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
