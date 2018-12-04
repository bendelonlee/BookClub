class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :rating
  validates_presence_of :text

  belongs_to :user
  belongs_to :book
end
