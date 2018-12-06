require "rails_helper"
describe 'I click on a user name on a book review' do
  before(:each) do
    author_1 = Author.create!(name: "Ernest Hemmingway")
    book_1 = author_1.books.create!(title: "Long Day", page_count: 375, publish_year: 1912)
    book_2 = author_1.books.create!(title: "Journey Of Dogs", page_count: 500, publish_year: 1900)
    @user_1 = User.create!(name: "Bob")
    @review_1 = book_1.reviews.create!(title: "Wow.", rating: 5, user_id: @user_1.id, text: "This book flew by! It was amazing!")
    @review_2 = book_2.reviews.create!(title: "OH.", rating: 1, user_id: @user_1.id, text: "I think I got this book after I read it and I was like .. Oh.")

    visit book_path(book_1)
    click_on @user_1.name
  end
  it 'shows me the all the reviews of that user' do
    expect(current_path).to eq(user_path(@user_1))
    expect(page).to have_content(@user_1.name)

    within "#review-#{@review_1.id}-container" do
      expect(page).to have_content(@review_1.book.title)
      expect(page).to have_content(@review_1.title)
      expect(page).to have_content(@review_1.rating)
      expect(page).to have_content(@review_1.text)
    end

    within "#review-#{@review_2.id}-container" do
      expect(page).to have_content(@review_2.book.title)
      expect(page).to have_content(@review_2.title)
      expect(page).to have_content(@review_2.rating)
      expect(page).to have_content(@review_2.text)
    end

  end
end
