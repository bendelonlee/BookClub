require "rails_helper"

describe 'Book index page navigation' do
  before :each do
    @author_1 = Author.create!(name: "Hemingway, Ernest")
    @book_1 = @author_1.books.create!(title: "Long Day", page_count: 375)
    @user_1 = User.create!(name: "Bob")
    @user_2 = User.create!(name: "Barb")
    @review_1 = @book_1.reviews.create!(title: "Wow.", rating: 5, user_id: @user_1.id, text: "This book flew by! It was amazing!")
    @review_2 = @book_1.reviews.create!(title: "Boo.", rating: 1, user_id: @user_2.id, text: "This book took too long to read! It was bad!")
  end

  context 'as a user' do
    it 'should route to book show page' do
      visit books_path
      
      click_link "book-title-#{@book_1.id}"

      expect(current_path).to eq(book_path(@book_1.id))
    end

    it 'should route to author show page' do
      visit authors_path

      click_link "author-#{@author_1.id}"

      expect(current_path).to eq(author_path(@author_1.id))
    end
  end
end
