class FavoritesController < ApplicationController
  before_action :book_params
  def create
    @favorite = current_user.favorites.create(book_id: params[:book_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
  end

  private

  def book_params
    @book = Book.find(params[:book_id])
  end

end
