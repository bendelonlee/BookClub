require "rails_helper"
RSpec.describe 'User adds a book' do
  describe 'as a user I navigate to the new book page from the books index' do
    before(:each) do
      @author_names = ["john tolkfriend", "mary higginsblott"]
      @book_title = "the best of elves"
      @page_count = 507

      visit books_path
      click_link "Add a book"
    end

    it 'allows them to add a book by filling in a form' do

      expect(current_path).to eq(new_book_path)

      fill_in "book[title]", with: @book_title
      fill_in "book[page_count]", with: @page_count
      fill_in "book[authors]", with: @author_names.join(", ")

      click_button "Create Book"

      expect(current_path).to eq(book_path(Book.last.id))
      expect(page).to have_content(@author_names.first.titleize)
      expect(page).to have_content(@author_names.last.titleize)
      expect(page).to have_content(@book_title.titleize)
      expect(page).to have_content(@page_count)
    end

    it 'returns an error if no author is given' do
      fill_in "book[title]", with: @book_title
      fill_in "book[page_count]", with: @page_count
      click_button "Create Book"
      expect(page).to have_content("Author can't be blank")
      visit books_path
      expect(page).to_not have_content(@book_title.titleize)
    end

    it 'returns an error if no title is given' do
      fill_in "book[page_count]", with: @page_count
      fill_in "book[authors]", with: @author_names.join(", ")
      click_button "Create Book"
      expect(page).to have_content("Title can't be blank")
    end

    it 'returns an error if no page count is given' do
      fill_in "book[title]", with: @book_title
      fill_in "book[authors]", with: @author_names.join(", ")
      click_button "Create Book"
      expect(page).to have_content("Page count can't be blank")
    end

    it 'returns an error if book title is not unique' do
      author_1 = Author.create(name: "Joe")
      author_1.books.create(title: @book_title, page_count: @page_count)
      fill_in "book[title]", with: @book_title
      fill_in "book[page_count]", with: @page_count
      fill_in "book[authors]", with: @author_names.join(", ")
      click_button "Create Book"
      expect(page).to have_content("Title has already been taken")
    end
    context "when any of the author's names already exists in the database" do
      it "adds that book to the author's books" do
        author_1_name = @author_names.first
        Author.create!(name: author_1_name)
        fill_in "book[title]", with: @book_title
        fill_in "book[page_count]", with: @page_count
        fill_in "book[authors]", with: @author_names.join(", ")

        click_button "Create Book"
        expect(current_path).to eq(book_path(Book.last.id))
        expect(page).to have_content(author_1_name.titleize)
        expect(page).to have_content(@author_names.last.titleize)
        expect(page).to have_content(@book_title.titleize)
        click_link author_1_name.titleize
        expect(current_path).to eq(author_path(Author.find_by(name: author_1_name.titleize)))

        expect(page).to have_content(@book_title.titleize)
      end
    end
  end
end
