class AddReferencesToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :user, foreign_key: true
    add_reference :reviews, :book, foreign_key: true
  end
end
