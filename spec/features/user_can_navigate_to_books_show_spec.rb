require "rails_helper"

describe "Navigating to book show from clicking book name" do
  before :each do
    @author = Author.create!(name: "Boy, Johnny")
    @user = User.create!(name: "Egress Mcgovern")
    @book = @author.books.create!(page_count: 123, title: "Yes, You Will Do It", publish_year: 2012)
      @book.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love", user_id: @user.id)
  end

  it 'should link from books index' do
    visit books_path

    click_link "book-title-#{@book.id}"

    expect(current_path).to eq(book_path(@book))
  end

  it 'should link from author show page' do
    visit author_path(@author)

    click_link "book-title-#{@book.id}"

    expect(current_path).to eq(book_path(@book))
  end

  it 'should link from a user review of book' do
    visit user_path(@user)

    click_link "book-title-#{@book.id}"

    expect(current_path).to eq(book_path(@book))
  end
end
