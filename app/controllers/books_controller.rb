class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create!(book_params)
    create_authors.each do |author|
      BookAuthor.create!(author_id: author.id, book_id: book.id)
    end
    redirect_to book_path(book)
  end

  private

  def book_params
    temp_params = params.require(:book).permit(:title, :page_count)
    temp_params
  end

  def create_authors
    author_params = params.require(:book).permit(:authors)
    author_names = author_params[:authors].split(", ")
    author_names.map do |name|
      Author.create!(name: name.titleize)
    end
  end
end
