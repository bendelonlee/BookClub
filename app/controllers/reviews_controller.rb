class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book = Book.find(params["book_id"])
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end


  private

  def review_params
    temp_params = params.require(:review).permit(:title, :rating, :text, :user)
    unless temp_params[:user].empty?
      user_id = User.find_by(name: temp_params[:user].titleize).id
    end
    temp_params.delete(:user)
    temp_params[:user_id] = user_id
    temp_params
  end

end
