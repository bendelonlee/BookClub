class Author < ApplicationRecord
  before_validation :titleize_name

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  has_many :book_authors
  has_many :books, through: :book_authors

  def titleize_name
    self.name = name.titleize if name
  end
end
