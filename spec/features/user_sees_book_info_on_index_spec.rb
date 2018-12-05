require "rails_helper"

describe 'Books index page' do
  context 'as a user' do
    it'should show all book information' do
      author_1 = Author.create!(name: "Hemingway, Ernest")
      book_1 = author_1.books.create!(title: "Long Day", page_count: 370, publish_year: 1998)

      author_2 = Author.create!(name: "JK Rowling")
      book_2 = author_2.books.create!(title: "Wizards Stone", page_count: 375, publish_year: 1999)

      author_3 = Author.create!(name: "Bradbury, Ray")
      book_3 = author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)

      visit books_path

      expect(page).to have_content(book_1.title)
      expect(page).to have_content("Author: #{book_1.authors.first.name}")
      expect(page).to have_content(book_1.page_count)
      expect(page).to have_content(book_1.publish_year)

      expect(page).to have_content(book_2.title)
      expect(page).to have_content("Author: #{book_2.authors.first.name}")
      expect(page).to have_content(book_2.page_count)
      expect(page).to have_content(book_2.publish_year)

      expect(page).to have_content(book_3.title)
      expect(page).to have_content("Author: #{book_3.authors.first.name}")
      expect(page).to have_content(book_3.page_count)
      expect(page).to have_content(book_3.publish_year)
    end
  end
end
