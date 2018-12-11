class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :reviews

  def self.top_users_by_reviews(num_of_users = nil)
    joins(:reviews)
      .group("users.id")
      .order("COUNT(reviews.id) DESC", :name)
      .limit(num_of_users)
  end

  def self.get_name_for(user_id)
    where("id = #{user_id}").pluck(:name)[0]
  end

  def sort_reviews(sort_params)
    if sort_params[:rating]
      direction = sort_params[:rating][:direction]
      reviews.order("rating #{direction}, reviews.created_at #{direction}")
    elsif sort_params[:date]
      reviews.order("reviews.created_at #{sort_params[:date][:direction]}")
    end
  end
end
