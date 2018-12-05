class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book = Book.find(params["book_id"])
  end

  def create
    book = Book.find(params["book_id"])
    @user = User.find_by(name: params[:review][:user].titleize)
    @review = Review.create!(
      {
        title:  params[:review][:title],
        rating: params[:review][:rating],
        text:   params[:review][:text],

        user_id: @user.id,
        book_id: book.id
      }
    )
    redirect_to book_path(book.id)
  end

end
