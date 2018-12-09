require "rails_helper"

describe 'Top Authors on Book Index page' do
  before :each do
    @author_1 = Author.create!(name: "Hemingway, Ernest")
    @book_1 = @author_1.books.create!(title: "Long Day", page_count: 370, publish_year: 1998)
    @book_2 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_3 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)

    @author_2 = Author.create!(name: "JK Rowling")
    @book_4 = @author_2.books.create!(title: "Wizards Stone", page_count: 375, publish_year: 1999)
    @book_5 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_6 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)

    @author_3 = Author.create!(name: "Bradbury, Ray")
    @book_7 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_8 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_9 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)

    @author_4 = Author.create!(name: "Bradbury, Ray")
    @book_10 = @author_4.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_11 = @author_4.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    @book_12 = @author_4.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)

  end

  it 'should show top authors' do

  end
end
