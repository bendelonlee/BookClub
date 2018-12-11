class Author < ApplicationRecord
  before_validation :titleize_name

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  def self.top_authors(number = nil)
    Author.joins(books: [:reviews]).group(:author_id).order("AVG(reviews.rating)").limit(number)
  end

  def titleize_name
    self.name = name.titleize if name
  end
end
