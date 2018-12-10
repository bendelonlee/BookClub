class Author < ApplicationRecord
  before_validation :titleize_name

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  def self.top_authors(limit)
    Author.all.sort_by{|a| -a.all_books_review_average}[0..(limit - 1)]
  end

  def titleize_name
    self.name = name.titleize if name
  end

  def all_books_review_average
    return 0 if books.joins(:reviews).count == 0
    books.reduce(0) do |sum, book|
      sum += book.reviews.sum(:rating)
    end/self.books.joins(:reviews).count
  end
end
