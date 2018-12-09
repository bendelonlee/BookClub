require "rails_helper" do
  describe "Navigating to user show" do
    before :all do
      @author = Author.create!(name: "Boy, Johnny")
      @user = User.create!(name: "Egress Mcgovern")
      @book = @author.books.create!(page_count: 123, title: "Yes, You Will Do It", publish_year: 2012)
        @book.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love", user_id: @user.id)
    end
    it 'should link from author show' do
      visit author_path(@author)

      click_link "user-name-#{@user.id}"

      expect(current_path).to eq(user_path(@user))
    end

    it 'should link from book index' do
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
end
