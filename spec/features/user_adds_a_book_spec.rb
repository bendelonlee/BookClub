require "rails_helper"
RSpec.describe 'User adds a book' do
  describe 'as a user I navigate to the new book page from the books index' do
    it 'allows me to add a book by filling in a form' do
      author_name = "John R.F. Tolkfriend"
      Author.create!(name: author_name)
      book_title = "The Best of Elves"
      page_count = 507

      visit books_path
      click_link "Add a book"
      expect(current_path).to eq(new_book_path)

      fill_in "book[title]", with: book_title
      fill_in "book[page_count]", with: page_count
      fill_in "book[author]", with: author_name

      click_button "Create Book"

      expect(current_path).to eq(book_path(Book.last.id))
      expect(page).to have_content(author_name)
      expect(page).to have_content(book_title)
      expect(page).to have_content(page_count)
    end
  end
end
