class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_three = Book.rated_books(:top, 3)
    @bottom_three = Book.rated_books(:bottom, 3)
    @top_users = User.top_users_by_reviews(3)
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def create
    encountered_error = false
    @book = Book.new(book_params)

    if @book.save
      created_authors = create_authors
      created_authors.each do |author|
        if author.id
          BookAuthor.create!(author_id: author.id, book_id: @book.id)
        else
          existing_author = Author.find_by(name: author.name)
          if existing_author
            @book_author = BookAuthor.create!(author_id: existing_author.id, book_id: @book.id)
          end
        end
      end
      if created_authors == []
        @book.errors.add(:author, "can't be blank")
        encountered_error = true
        @book.delete
      end
    else
      encountered_error = true
    end
    unless encountered_error
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def book_params
    temp_params = params.require(:book).permit(:title, :page_count)
    temp_params
  end

  def create_authors
    author_params = params.require(:book).permit(:authors)
    author_names = author_params[:authors]
    author_names = author_names.split(", ")
    author_names.map do |name|
      Author.create(name: name.titleize)
    end
  end
end
