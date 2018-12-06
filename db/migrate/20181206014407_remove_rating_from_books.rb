class RemoveRatingFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :rating, :integer
  end
end
