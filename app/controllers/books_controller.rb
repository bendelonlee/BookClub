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
    @top_reviews = @book.get_reviews(:top, 3)
    @bottom_reviews = @book.get_reviews(:bottom, 3)
  end

  def new
    @book = Book.new
  end

  def create
    encountered_error = false
    @book = Book.new(book_params)

    if @book.save
      create_authors.each do |author|
        if author.id
          BookAuthor.create!(author_id: author.id, book_id: @book.id)
        else
          existing_author = Author.find_by(name: author.name)
          if existing_author
            @book_author = BookAuthor.create!(author_id: existing_author.id, book_id: @book.id)
          else
            @book.errors.add(:author, "can't be blank")
            encountered_error = true
            @book.delete
          end
        end
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

  def destroy
    @book = Book.find(params[:id])
    @book.book_authors.each { |b_a| b_a.destroy   }
    @book.destroy
    redirect_to books_path
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

      #Working solution
      name = name[0..1] == '#<' ? "" : name

      Author.create(name: name.titleize)
    end
  end
end
