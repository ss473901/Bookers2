class UsersController < ApplicationController
   
  def index
   @users = User.all
   
  end
  
  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
    redirect_to books_path(@book.id)
   else
    render :index
   end
  end
  
  def show
   @user = User.find(params[:id])
   @book = Book.new
  end
   
  def edit
   @user = User.find(params[:id])
  end
   
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
   else
    render :edit
   end
  end
  
  private
  def user_params
   params. require(:user) .permit(:name, :email, :profile_image, :profile)
  end
 end