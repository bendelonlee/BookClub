require "rails_helper"

describe 'User navigates to Book Show Page' do
  before(:each) do
    @book = Book.create!(title: "Romantic Titanic", page_count: 201, publish_year: 2017)
    @author = @book.authors.create!(name: "Sally Lovehart")
    visit book_path(@book)
  end
  context 'when they click on a delete button' do
    before(:each) do
      click_on "Delete Book"
    end
    it "no longer displays in the book index" do
      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(@book.title)
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
