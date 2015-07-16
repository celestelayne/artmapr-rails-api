class SessionsController < ApplicationController

  before_action :current_user

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    # @user = User.create(user_params)

    if @user
      login(@user)
      flash[:success] = "Welcome to the ArtMapr API"
      redirect_to user_path
    else
      flash.now[:error] = "Invalid email/password combination"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "You have successfully logged out."
    redirect_to ("/")
  end

end
