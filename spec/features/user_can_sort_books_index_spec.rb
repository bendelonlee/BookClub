require "rails_helper"

RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

describe "Book Index Sorting" do
  before :each do
    @user_1 = User.create!(name: Faker::Name.unique.name)
    @author_2 = Author.create!(name: Faker::Name.unique.name)
    @author_3 = Author.create!(name: Faker::Name.unique.name)

    @book_4 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_5 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_6 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @book_7 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @book_8 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @author_2.books += [@book_4,@book_5,@book_6,@book_7,@book_8]

    @book_9 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_9.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_10 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_10.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_11 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_11.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_12 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_12.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
      @book_12.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_13 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
      @book_13.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user_1.id, text: Faker::RickAndMorty.quote)
    @book_14 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @author_3.books += [@book_9,@book_10,@book_11,@book_12,@book_13,@book_14]
  end
  it 'should have link to sort by average rating in ascending order' do
    visit books_path

    click_link "rating-asc"
    binding.pry
    ordered = Book.joins(:reviews)
      .group("books.id", "books.title")
      .order("AVG(reviews.rating) ASC")

    check_for_order(ordered)
  end

  it 'should have link to sort by average rating in descending order' do
    visit books_path

    click_link "rating-desc"

    ordered = Book.joins(:reviews)
      .group("books.id", "books.title")
      .order("AVG(reviews.rating) DESC")

    check_for_order(ordered)
  end

  xit 'should have link to sort by number of pages in ascending order' do
    visit books_path

    click_link "pages-asc"

    ordered = Book.order("page_count ASC")

    check_for_order(ordered)
  end

  xit 'should have link to sort by number of pages in descending order' do
    visit books_path

    click_link "pages-desc"

    ordered = Book.order("page_count DESC")

    check_for_order(ordered)
  end

  xit 'should have link to sort by number of reviews in ascending order' do
    visit books_path

    click_link "reviews-asc"

    ordered = Book.joins(:reviews)
      .group("books.id", "books.title")
      .order("COUNT(reviews.id) ASC")

    check_for_order(ordered)
  end

  xit 'should have link to sort by number of reviews in descending order' do
    visit books_path

    click_link "reviews-desc"

    ordered = Book.joins(:reviews)
      .group("books.id", "books.title")
      .order("COUNT(reviews.id) DESC")

    check_for_order(ordered)
  end

  def check_for_order(ordered_books)
    ordered_books.each_with_index do |book, i|
      break if i == ordered.length
      expect("book-#{book.id}").to appear_before("book-#{ordered[i+1].title}")
    end
  end
end
