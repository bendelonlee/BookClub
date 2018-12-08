require "rails_helper"

describe 'Author names navigate to author show page' do
  before :each do
    @author_1 = Author.create!(name: "Hemingway, Ernest")
    @book_1 = @author_1.books.create!(title: "Long Day", page_count: 370, publish_year: 1998)

    @author_2 = Author.create!(name: "JK Rowling")
    @book_2 = @author_2.books.create!(title: "Wizards Stone", page_count: 375, publish_year: 1999)

    @author_3 = Author.create!(name: "Bradbury, Ray")
    @book_3 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
  end

  it 'links on book index' do
    visit books_path

    click_link "author-#{@author_1.id}"

    expect(current_path).to eq(author_path(@author_1))
  end

  it 'links on book show page' do
    visit book_path(@book_2.id)

    click_link "author-#{@author_2.id}"

    expect(current_path).to eq(author_path(@author_2))
  end

  it 'links on author index page' do
    visit authors_path

    click_link "author-#{@author_3.id}"

    expect(current_path).to eq(author_path(@author_3))
  end
end
