class BooksController < ApplicationController
  def index
    @books = sorted_books(params[:sort]) if params[:sort]
    @books = Book.all unless @books
    @top_three = Book.rated_books(:top, 3)
    @bottom_three = Book.rated_books(:bottom, 3)
    @top_users = User.top_users_by_reviews(3)
    @top_authors = Author.top_authors(3)
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
    @average_review = @book.average_review
    @top_reviews = @book.get_reviews(:top, 3)
    @bottom_reviews = @book.get_reviews(:bottom, 3)
    @bottom_reviews = @bottom_reviews.select {|rev| !@top_reviews.include?(rev)}
  end

  def new
    @book = Book.new
    @author = Author.new
  end

  def create
    @book = Book.new(book_params)
    created_authors = create_authors
    if created_authors.any? && @book.save
      created_authors.each do |author|
        @book_author = BookAuthor.create!(author_id: author.id, book_id: @book.id)
      end
      redirect_to book_path(@book)
    else
      @book.errors.add(:author, "can't be blank") if created_authors.empty?
      render :new
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def sorted_books(sort_param)
    case sort_param
    when /rating-(desc|asc)/ then Book.ordered_by_rating(sort_param.split('-')[1])
    when /pages-(desc|asc)/ then Book.order("page_count #{sort_param.split('-')[1]}")
    when /reviews-(desc|asc)/ then Book.ordered_by_reviews(sort_param.split('-')[1])
    else nil
    end
  end

  def book_params
    temp_params = params.require(:book).permit(:title, :page_count)
    temp_params
  end

  def create_authors
    author_params = params.require(:book).permit(:authors)
    author_names = author_params[:authors]
    author_names = author_names.split(", ")
    author_names.map do |name|
      Author.find_or_create_by(name: name.titleize)
    end
  end
end
