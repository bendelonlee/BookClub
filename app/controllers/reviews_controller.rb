class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @book = Book.find(params["book_id"])
  end

  def create
    temp_review_params = review_params
    unless temp_review_params[:user].empty?
      user_id = User.find_by(name: temp_review_params[:user].titleize).id
    end
    temp_review_params.delete(:user)
    temp_review_params[:user_id] = user_id
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(temp_review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end


  private

  def review_params
    params.require(:review).permit(:title, :rating, :text, :user)
  end

end
