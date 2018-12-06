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
end
