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

  def get_reviews(order, number_of_r)
    reviews.order("rating #{order.to_s}")
  end
end
