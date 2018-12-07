class Book < ApplicationRecord
  before_validation :titleize_title

  validates_presence_of :title, :page_count
  validates_uniqueness_of :title, case_sensitive: false

  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors

  def titleize_title
    self.title = title.titleize if title
  end

  def self.rated_books(top_or_bottom, number)
    order = top_or_bottom == :top ? "DESC" : "ASC"
    joins(:reviews)
      .group(:book_id, "books.title")
      .order("AVG(reviews.rating) #{order}")
      .limit(number)
      .pluck("books.title", "AVG(reviews.rating)")
  end

  def get_reviews(top_or_bottom, number_of)
    order = top_or_bottom == :top ? "DESC" : "ASC"
    reviews_with_ids = self.reviews.order("rating #{order}").limit(number_of).pluck(:title, :rating, :user_id)
    reviews_with_ids.map do |r|
      r[-1] = User.get_name_for(r[-1]); r
    end
  end
end
