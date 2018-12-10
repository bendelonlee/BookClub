class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to books_path
  end
end
