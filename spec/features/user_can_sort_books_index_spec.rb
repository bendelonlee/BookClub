require "rails_helper"

describe "Book Index Sorting" do
  before :each do
    @author_2 = Author.create!(name: Faker::Name.unique.name)
    @author_3 = Author.create!(name: Faker::Name.unique.name)

    @book_4 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_23.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)
    @book_5 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_1.id, text: Faker::RickAndMorty.quote)
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_20.id, text: Faker::RickAndMorty.quote)
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)
    @book_6 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @book_7 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @book_8 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_22.id, text: Faker::RickAndMorty.quote)
      @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
      @book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)
    @author_2.books += [book_4,book_5,book_6,book_7,book_8]

    @book_9 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_2.id, text: Faker::RickAndMorty.quote)
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)
    @book_10 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_4.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_5.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)
    @book_11 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_3.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_20.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_19.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_14.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_18.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_17.id, text: Faker::RickAndMorty.quote)
    @book_12 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_12.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_14.id, text: Faker::RickAndMorty.quote)
      @book_12.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)
    @book_13 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_13.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user_16.id, text: Faker::RickAndMorty.quote)
    @book_14 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @author_3.books += [book_9,book_10,book_11,book_12,book_13,book_14]
end
  it 'should have link to sort by average rating in ascending order' do

  end

  it 'should have link to sort by average rating in descending order' do

  end

  it 'should have link to sort by number of pages in descending order' do

  end

  it 'should have link to sort by number of reviews in ascending order' do

  end

  it 'should have link to sort by number of reviews in descending order' do

  end
end
