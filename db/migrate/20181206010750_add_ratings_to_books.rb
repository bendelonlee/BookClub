class AddRatingsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :rating, :integer
  end
end
