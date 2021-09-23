class UsersController < ApplicationController
  
 def index
  @users = User.all
 end
 
 def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  @book.save
  redirect_to book_path(@book.id)
 end
  
 def show
  @user = User.find(params[:id])
 end
  
 def edit
  @user = User.find(params[:id])
 end
  
 def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
 end
 
 private
 def user_params
  params. require(:user) .permit(:name, :email, :profile_image, :profile)
 end
end
