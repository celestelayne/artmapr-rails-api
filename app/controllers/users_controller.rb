class UsersController < ApplicationController

  before_action :logged_in?, only: [:show, :edit, :update, :destroy]
  before_filter :redirect_unauthenticated, except: [:new, :create, :show]

  # Grabs the users
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Welcome to the ArtMapr API"
      redirect_to @user
    else
      render 'new'
    end

    # redirect_to "/users/#{@user.id}"
    # redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    if current_user == @user
    else
      flash[:warning] = "Sorry, you can only edit your own profile"
      redirect_to user_path
    end
  end

  def update
    respond_to do |format|
      if @current_user.update(user_params)
        format.html { redirect_to @current_user, alert: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
