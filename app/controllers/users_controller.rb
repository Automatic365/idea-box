class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  def show
    @user = User.find params[:id]
    unless session[:user_id] == @user.id
      flash[:notice] = "You don't have access to that nigga!"
      redirect_to user_path(session[:user_id])
      return
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
