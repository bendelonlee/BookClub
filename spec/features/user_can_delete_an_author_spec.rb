!require "rails_helper"

describe 'User navigates to Author Show Page' do
  before(:each) do
    @book = Book.create!(title: "Romantic Titanic", page_count: 201, publish_year: 2017)
    @author_1 = @book.authors.create!(name: "Sally Lovehart")
    @author_2 = @book.authors.create!(name: "Clive Lovehart")
    visit author_path(@author_1)
  end
  
  context 'when they click on a delete link or button' do
    before(:each) do
      click_on "Delete Author"
    end
    it "no longer displays the author in the book index" do
      expect(current_path).to eq(books_path)
      expect(page).to_not have_content(@author_1.name)
      expect(page).to_not have_content(@book.title)

      visit authors_path
      expect(page).to have_content(@author_2.name)
    end
  end
end

# As a Visitor,
# When I visit an author's show page,
# I see a link on the page to delete the author.
# This link should return me to the book index page where I
# no longer see this author listed.
# If this author was the only author for any book, that book is also deleted.
# If this author co-authored a book with someone else, that book should also be deleted, but not the other author.
#
# (you may need to delete other content before you can delete an author or book)
