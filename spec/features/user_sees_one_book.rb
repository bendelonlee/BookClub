require "rails_helper"
describe 'user sees the show page of one book' do
  it 'displays the books information and reviews' do
    book_1 = Book.create!(title: "Long Day", author: "Ernest Hemmingway", page_count: 375)
    user_1 = User.create!(name: "Bob")
    user_2 = User.create!(name: "Barb")
    review_1 = Book.reviews.create!(title: "Wow.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
    review_2 = Book.reviews.create!(title: "Boo.", rating: 1, user_id: user_2.id, text: "This book took too long to read! It was bad!")

    visit book_page(book_1.id)

    expect(page).to have_content(book_1.title)
    expect(page).to have_content(book_1.author)
    expect(page).to have_content(book_1.page_count)

    expect(page).to have_content(user_1.name)
    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.text)
    
    expect(page).to have_content(user_2.name)
    expect(page).to have_content(review_2.title)
    expect(page).to have_content(review_2.rating)
    expect(page).to have_content(review_2.text)

  end
end
