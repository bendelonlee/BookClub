class Book < ApplicationRecord
  before_validation :titleize_title

  validates_presence_of :title, :page_count
  validates_uniqueness_of :title, case_sensitive: false

  has_many :reviews
  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors

  def titleize_title
    self.title = title.titleize if title
  end

  def self.rated_books(top_or_bottom, number = nil)
    order = top_or_bottom == :top ? "DESC" : "ASC"
    joins(:reviews)
      .group("books.id")
      .order("AVG(reviews.rating) #{order}")
      .limit(number)
  end

  def self.ordered_by_rating(asc_or_desc)
    joins(:reviews)
      .group("books.id")
      .order("AVG(reviews.rating) #{asc_or_desc}")
  end

  def self.ordered_by_reviews(asc_or_desc)
    joins(:reviews)
      .group("books.id")
      .order("COUNT(reviews.id) #{asc_or_desc}")
  end

  def get_reviews(top_or_bottom, number_of)
    order = top_or_bottom == :top ? "DESC" : "ASC"
    reviews.order("rating #{order}").limit(number_of)
  end

  def top_review
    max_rating = Review.where(book: self).maximum(:rating)
    Review.where(book: self).find_by(rating: max_rating)
  end

  def average_review
    reviews.average(:rating)
  end
end
