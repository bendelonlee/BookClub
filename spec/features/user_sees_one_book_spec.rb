require "rails_helper"
describe 'user sees the show page of one book' do
  it 'displays the books information and reviews' do
    author_1 = Author.create!(name: "Ernest Hemmingway")
    author_2 = Author.create!(name: "Spot")
    book_1 = author_1.books.create!(title: "Long Day", page_count: 375, publish_year: 2012)
    BookAuthor.create!(author_id: author_2.id, book_id: book_1.id)
    user_1 = User.create!(name: "Bob")
    user_2 = User.create!(name: "Barb")
    review_1 = book_1.reviews.create!(title: "Wow.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
    review_2 = book_1.reviews.create!(title: "Boo.", rating: 1, user_id: user_2.id, text: "This book took too long to read! It was bad!")

    visit book_path(book_1.id)

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(author_1.name)
    expect(page).to have_content(author_2.name)
    expect(page).to have_content(book_1.page_count)
    expect(page).to have_content(book_1.publish_year)

    expect(page).to have_content(user_1.name)
    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.text)

    expect(page).to have_content(user_2.name)
    expect(page).to have_content(review_2.title)
    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_2.text)
  end

  it 'shows statistics about the book' do
    book_1 = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))

    user_1 = User.create!(name: Faker::Name.unique.name)
    user_2 = User.create!(name: Faker::Name.unique.name)
    user_3 = User.create!(name: Faker::Name.unique.name)
    user_4 = User.create!(name: Faker::Name.unique.name)
    user_5 = User.create!(name: Faker::Name.unique.name)
    user_6 = User.create!(name: Faker::Name.unique.name)

    review_1 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_1.id, text: Faker::RickAndMorty.quote)
    review_2 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 1, user_id: user_2.id, text: Faker::RickAndMorty.quote)
    review_3 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 2, user_id: user_3.id, text: Faker::RickAndMorty.quote)
    review_4 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 3, user_id: user_4.id, text: Faker::RickAndMorty.quote)
    review_5 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 4, user_id: user_5.id, text: Faker::RickAndMorty.quote)
    review_6 = book_1.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: 5, user_id: user_6.id, text: Faker::RickAndMorty.quote)

    visit book_path(book_1.id)

    top_three = book_1.reviews.order("rating DESC").limit(3).pluck(:title, :rating, :user_id)
    bottom_three = book_1.reviews.order(:rating).limit(3).pluck(:title, :rating, :user_id)
    top_usernames = User.where("id IN (?)", top_three.map{|rev| rev.last}).pluck(:name)
    bottom_usernames = User.where("id IN (?)", bottom_three.map{|rev| rev.last}).pluck(:name)
    within ".top-reviews" do
      expect(page).to have_content("User: #{top_usernames[0]}")
      expect(page).to have_content("Title: #{top_three[0][0]}")
      expect(page).to have_content("Rating: #{top_three[0][1]}")

      expect(page).to have_content("User: #{top_usernames[1]}")
      expect(page).to have_content("Title: #{top_three[1][0]}")
      expect(page).to have_content("Rating: #{top_three[1][1]}")

      expect(page).to have_content("User: #{top_usernames[2]}")
      expect(page).to have_content("Title: #{top_three[2][0]}")
      expect(page).to have_content("Rating: #{top_three[2][1]}")
    end
    within ".bottom-reviews" do
      expect(page).to have_content("User: #{bottom_usernames[0]}")
      expect(page).to have_content("Title: #{bottom_three[0][0]}")
      expect(page).to have_content("Rating: #{bottom_three[0][1]}")

      expect(page).to have_content("User: #{bottom_usernames[1]}")
      expect(page).to have_content("Title: #{bottom_three[1][0]}")
      expect(page).to have_content("Rating: #{bottom_three[1][1]}")

      expect(page).to have_content("User: #{bottom_usernames[2]}")
      expect(page).to have_content("Title: #{bottom_three[2][0]}")
      expect(page).to have_content("Rating: #{bottom_three[2][1]}")
    end
    within '#total-average-rating' do
      expect(page).to have_content("Average Rating: #{book_1.reviews.average(:rating)}")
    end
    
  end

end
