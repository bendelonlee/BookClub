require "rails_helper"

describe 'Top Authors on Book Index page' do
  before :each do
    user = User.create!(name: Faker::Name.unique.name)
    @author_1 = Author.create!(name: Faker::Name.unique.name)
      @book_1 = @author_1.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
      @book_2 = @author_1.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

    @author_2 = Author.create!(name: Faker::Name.unique.name)
      @book_3 = @author_2.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
      @book_4 = @author_2.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

    @author_3 = Author.create!(name: Faker::Name.unique.name)
      @book_5 = @author_3.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
      @book_6 = @author_3.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

    @author_4 = Author.create!(name: Faker::Name.unique.name)
      @book_7 = @author_4.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
      @book_8 = @author_4.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
        @book_8.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        @book_8.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

    visit books_path
  end

  it 'should show top authors' do
    top_authors = Author.top_authors(3)

    within '.top_authors' do
      expect(page).to have_content("Author: #{top_authors[0].name}, Average Rating: #{top_authors[0].all_books_review_average}")
      expect(page).to have_content("Author: #{top_authors[1].name}, Average Rating: #{top_authors[1].all_books_review_average}")
      expect(page).to have_content("Author: #{top_authors[2].name}, Average Rating: #{top_authors[2].all_books_review_average}")
    end
  end
end
