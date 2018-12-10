require "rails_helper"

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
  describe 'relationships' do
    it { should have_many(:books) }
  end
  describe 'class methods' do
    it '.top_authors' do
      user = User.create!(name: Faker::Name.unique.name)

      author_1 = Author.create!(name: Faker::Name.unique.name)
        book_1 = author_1.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        book_2 = author_1.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

      author_2 = Author.create!(name: Faker::Name.unique.name)
        book_3 = author_2.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        book_4 = author_2.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

      author_3 = Author.create!(name: Faker::Name.unique.name)
        book_5 = author_3.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        book_6 = author_3.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

      author_4 = Author.create!(name: Faker::Name.unique.name)
        book_7 = author_4.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_7.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        book_8 = author_4.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_8.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_8.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

      top_authors = Author.all.sort_by{|a| -a.all_books_review_average}[0..2]

      expect(Author.top_authors(3)).to eq(top_authors)
    end
  end
  describe 'instance methods' do
    it "titleizes the name" do
      author_1 = Author.new(name: "arthur")
      author_1.titleize_name
      expect(author_1.name).to eq("Arthur")
    end
    it '.all_books_review_average' do
      user = User.create!(name: Faker::Name.unique.name)
      author = Author.create!(name: Faker::Name.unique.name)
        book_1 = author.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
        book_2 = author.books.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1975..2018))
          book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)
          book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: user.id, text: Faker::RickAndMorty.quote)

      author_average = author.books.reduce(0) do |sum, book|
        sum += book.reviews.sum(:rating)
      end/author.books.joins(:reviews).count

      expect(author.all_books_review_average).to eq(author_average)
    end
  end
end
