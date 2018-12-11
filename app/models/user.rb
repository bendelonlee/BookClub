class User < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :reviews

  def self.top_users_by_reviews(num_of_users = nil)
    joins(:reviews)
      .select("COUNT(user_id)")
      .group(:user_id, :name)
      .order("COUNT(user_id) DESC", :name)
      .limit(num_of_users)
      .pluck(:user_id, :name, "COUNT(user_id)")
  end

  def self.get_name_for(user_id)
    where("id = #{user_id}").pluck(:name)[0]
  end

  def sort_reviews(sort_params)
    if sort_params[:rating]
      rating_dir = sort_params[:rating]
      date_dir = rating_dir == 'asc' ? 'desc' : 'asc'
      reviews.order("rating #{rating_dir}, reviews.created_at #{date_dir}")
    elsif sort_params[:date]
    end
  end
end
