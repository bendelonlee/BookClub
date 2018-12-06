class Review < ApplicationRecord
  validates_presence_of :title, :text

  validates :rating, presence: {message: "is a required field"}
  
  belongs_to :user
  belongs_to :book
end
