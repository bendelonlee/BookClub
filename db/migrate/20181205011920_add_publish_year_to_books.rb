class AddPublishYearToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :publish_year, :integer
  end
end
