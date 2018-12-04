class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :page_count

  has_many :reviews
  has_many :book_authors
  has_many :authors, through: :book_authors
end
