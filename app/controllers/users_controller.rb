class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_id = params[:id]
    @reviews = @user.sort_reviews(params['review_sort']) if params[:review_sort]
    @reviews = @user.reviews unless @reviews
  end

end
