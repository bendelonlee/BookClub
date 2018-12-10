class Author < ApplicationRecord
  before_validation :titleize_name

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  def titleize_name
    self.name = name.titleize if name
  end

  def all_books_review_average
    books.reduce(0) do |sum, book|
      sum += book.reviews.average(:rating)
    end/self.books.count
  end
end
