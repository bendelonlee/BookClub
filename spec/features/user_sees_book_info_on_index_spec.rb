require "rails_helper"

describe 'Books index page' do
  context 'as a user' do
    before :each do
      @author_1 = Author.create!(name: "Hemingway, Ernest")
      @book_1 = @author_1.books.create!(title: "Long Day", page_count: 370, publish_year: 1998)

      @author_2 = Author.create!(name: "JK Rowling")
      @book_2 = @author_2.books.create!(title: "Wizards Stone", page_count: 375, publish_year: 1999)

      @author_3 = Author.create!(name: "Bradbury, Ray")
      @book_3 = @author_3.books.create!(title: "Pluto Chronicoles", page_count: 372, publish_year: 1994)
    end

    it'should show all book information' do
      visit books_path

      expect(page).to have_content(@book_1.title)
      expect(page).to have_content("Author: #{@book_1.authors.first.name}")
      expect(page).to have_content(@book_1.page_count)
      expect(page).to have_content(@book_1.publish_year)

      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("Author: #{@book_2.authors.first.name}")
      expect(page).to have_content(@book_2.page_count)
      expect(page).to have_content(@book_2.publish_year)

      expect(page).to have_content(@book_3.title)
      expect(page).to have_content("Author: #{@book_3.authors.first.name}")
      expect(page).to have_content(@book_3.page_count)
      expect(page).to have_content(@book_3.publish_year)
    end

    it 'should show information for ratings for each book' do
      user_1 = User.create!(name: "Bob")
      user_2 = User.create!(name: "Barb")
      review_1 = @book_1.reviews.create!(title: "Wow.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
      review_2 = @book_1.reviews.create!(title: "Boo.", rating: 1, user_id: user_1.id, text: "This book took too long to read! It was bad!")
      review_3 = @book_2.reviews.create!(title: "Wow, compelling.", rating: 3, user_id: user_1.id, text: "This book flew by! It was amazing!")
      review_4 = @book_2.reviews.create!(title: "Boo, mediocore.", rating: 2, user_id: user_1.id, text: "This book took too long to read! It was bad!")
      review_5 = @book_2.reviews.create!(title: "Wow, changed my life.", rating: 3, user_id: user_1.id, text: "This book flew by! It was amazing!")
      review_6 = @book_3.reviews.create!(title: "Wow, must read.", rating: 5, user_id: user_1.id, text: "This book took too long to read! It was bad!")
      review_7 = @book_3.reviews.create!(title: "Wow, couldn't put down.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
      review_8 = @book_3.reviews.create!(title: "Wow, magnificient.", rating: 4, user_id: user_1.id, text: "This book took too long to read! It was bad!")
      review_9 = @book_3.reviews.create!(title: "Boo, fake news.", rating: 1, user_id: user_1.id, text: "This book flew by! It was amazing!")

      book_1_average = ([review_1,review_2].reduce(0){|sum, rev| sum += rev.rating}) / 2
      book_2_average = ([review_3,review_4,review_5].reduce(0){|sum, rev| sum += rev.rating}) / 3
      book_3_average = ([review_6,review_7,review_8,review_9].reduce(0){|sum, rev| sum += rev.rating}) / 4

      visit books_path

      expect(page).to have_content("Average Rating: #{book_1_average}")
      expect(page).to have_content("Average Rating: #{book_2_average}")
      expect(page).to have_content("Average Rating: #{book_3_average}")

      expect(page).to have_content("Total Reviews: #{@book_1.reviews.count}")
      expect(page).to have_content("Total Reviews: #{@book_2.reviews.count}")
      expect(page).to have_content("Total Reviews: #{@book_3.reviews.count}")
    end

    it 'should show statistics about the three top and lowest rated books' do
      user_1 = User.create!(name: Faker::Name.name)

      book_1 = Book.create!(title: "Book_1", page_count: rand(900), publish_year: rand(1950..2018))
      review_1 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_2 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      book_2 = Book.create!(title: "Book_2", page_count: rand(900), publish_year: rand(1950..2018))
      review_3 = book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_4 = book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      book_3 = Book.create!(title: "Book_3", page_count: rand(900), publish_year: rand(1950..2018))
      review_5 = book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_6 = book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      book_4 = Book.create!(title: "Book_4", page_count: rand(900), publish_year: rand(1950..2018))
      review_7 = book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_8 = book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_9 = book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 4, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_10 = book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      book_5 = Book.create!(title: "Book_5", page_count: rand(900), publish_year: rand(1950..2018))
      review_11 = book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_12 = book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_13 = book_5.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      book_6 = Book.create!(title: "Book_6", page_count: rand(900), publish_year: rand(1950..2018))
      review_14 = book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_15 = book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_1.id, text: Faker::RickAndMorty.quote)
      review_16 = book_6.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_1.id, text: Faker::RickAndMorty.quote)

      visit books_path

      books = [book_1, book_2, book_3, book_4, book_5, book_6]

      top_three = books.sort_by {|book| -book.reviews.average(:rating) }[0..2]
      bottom_three = books.sort_by {|book| book.reviews.average(:rating) }[0..2]

      top_three_expected = "Book: #{top_three[0].title}, " +
                 "Average Rating: #{top_three[0].reviews.average(:rating).round(2)} " +
                 "Book: #{top_three[1].title}, " +
                 "Average Rating: #{top_three[1].reviews.average(:rating).round(2)} " +
                 "Book: #{top_three[2].title}, " +
                 "Average Rating: #{top_three[2].reviews.average(:rating).round(2)}"
      expect(page).to have_content(top_three_expected)

      bottom_three_expected = "Book: #{bottom_three[0].title}, " +
                 "Average Rating: #{bottom_three[0].reviews.average(:rating).round(2)} " +
                 "Book: #{bottom_three[1].title}, " +
                 "Average Rating: #{bottom_three[1].reviews.average(:rating).round(2)} " +
                 "Book: #{bottom_three[2].title}, " +
                 "Average Rating: #{bottom_three[2].reviews.average(:rating).round(2)}"
      expect(page).to have_content(bottom_three_expected)
    end

    it 'should show statistics about the three users with most reviews' do
      user_1 = User.create!(name: "User_1")
      user_2 = User.create!(name: "User_2")
      user_3 = User.create!(name: "User_3")
      user_4 = User.create!(name: "User_4")

      book_1 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
        book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_2.id, text: Faker::RickAndMorty.quote)
        book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_3.id, text: Faker::RickAndMorty.quote)

      book_2 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
        book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_3.id, text: Faker::RickAndMorty.quote)
        book_2.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_2.id, text: Faker::RickAndMorty.quote)

      book_3 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
        book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_4.id, text: Faker::RickAndMorty.quote)
        book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_2.id, text: Faker::RickAndMorty.quote)
        book_3.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_3.id, text: Faker::RickAndMorty.quote)

      book_4 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
        book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_1.id, text: Faker::RickAndMorty.quote)
        book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_3.id, text: Faker::RickAndMorty.quote)
        book_4.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 4, user_id: user_4.id, text: Faker::RickAndMorty.quote)

      visit books_path

      top_users_expected = "User: #{user_3.name}, Total Reviews: #{user_3.reviews.count} " +
                           "User: #{user_2.name}, Total Reviews: #{user_2.reviews.count} " +
                           "User: #{user_4.name}, Total Reviews: #{user_4.reviews.count}"

      expect(page).to have_content(top_users_expected)
    end
  end
end
