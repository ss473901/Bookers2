class UsersController < ApplicationController

  def index
   @users = User.all
   @book = Book.new
   @follower_users = User.where.not(id: current_user.id)
   @user = current_user
  end

  def show
   @user = User.find(params[:id])
   @book = Book.new
  end

  def edit
      @user = User.find(params[:id])
   if @user == current_user
      render "edit"
   else
      redirect_to user_path(current_user)
   end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
    render :edit
   end
  end

  def followings
   user = User.find(params[:id])
   @users = user.followings
  end

  def followers
   user = User.find(params[:id])
   @users = user.followers
  end

  private
  def user_params
   params. require(:user) .permit(:name, :email, :profile_image, :introduction)
  end
 end