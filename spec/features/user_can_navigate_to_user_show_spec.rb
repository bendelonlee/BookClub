require "rails_helper"

describe "Navigating to user show" do
    before :each do
      @author = Author.create!(name: Faker::Name.unique)
      @user = User.create!(name: Faker::Name.unique)
      @book = @author.books.create!(page_count: 123, title: "Yes, You Will Do It, Today", publish_year: 2012)
        @book.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love so fast", user_id: @user.id)
    end

    it 'should link from author show' do
      visit author_path(@author)

      click_link "user-name-#{@user.id}"

      expect(current_path).to eq(user_path(@user))
    end

    it 'should link from book index stats section' do
      visit books_path

      click_link "user-name-#{@user.id}"

      expect(current_path).to eq(user_path(@user))
    end

    it 'should link from book show' do
      visit book_path(@book)

      click_link "user-name-#{@user.id}"

      expect(current_path).to eq(user_path(@user))
    end
end
