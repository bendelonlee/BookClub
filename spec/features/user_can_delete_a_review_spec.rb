require "rails_helper"

describe 'User navigates to User Show Page' do
  before(:each) do
    @book_1 = Book.create!(title: "Romantic Titanic", page_count: 201, publish_year: 2017)
    book_2 = Book.create!(title: "Romantic Gigantic", page_count: 201, publish_year: 2017)
    @user = User.create!(name: "Egress Mcgovern")
    @review_1 = @book_1.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love", user_id: @user.id)
    @review_2 = book_2.reviews.create!(title: "Too much", rating: 1, text: "This book was too much for me", user_id: @user.id)
    visit user_path(@user)
  end
  context 'when they click on a delete button for a review' do
    before(:each) do
      within "#review-#{@review_1.id}-container" do
        click_on "Delete Review"
      end
    end
    it "no longer displays in the user show page" do
      expect(current_path).to eq(user_path(@user))
      expect(page).to_not have_content(@review_1.title)
      expect(page).to_not have_content(@review_1.text)
      expect(page).to_not have_content(@book_1.title)

      expect(page).to have_content(@review_2.title)
    end
  end
end
# As a Visitor,
# When I visit a book's show page,
# I see a link on the page to delete the book.
# This link should return me to the book index page where I
# no longer see this book listed.
#
# (your controller may need to delete other content before you can delete the book)
