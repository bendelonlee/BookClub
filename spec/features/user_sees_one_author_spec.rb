require "rails_helper"
describe 'user sees the show page of one author' do
  before(:each) do

        @author_1 = Author.create!(name: "Doctor Wilkinson")
        @author_2 = Author.create!(name: "Margo Wilkinson")
        @book_1 = Book.create!(title: "Your Baby Will Be Fine", page_count: 201, publish_year: 2002)
        @book_2 = Book.create!(title: "Your Baby Might Not Be Okay", page_count: 202, publish_year: 2001)

        @author_1.books += [@book_1, @book_2]
        @author_2.books += [@book_1]

        @user_1 = User.create!(name: "user_1")
        @user_2 = User.create!(name: "user_2")
        @review_1 = @user_1.reviews.create!(title: "Good!", text: "Liked it!", rating: 5, book: @book_1)
        @review_2 = @user_2.reviews.create!(title: "Bad!", text: "Didn't Like it!", rating: 1, book: @book_1)
        
        visit author_path(@author_1)

  end
  it 'displays the authors information and the information of its books' do


    expect(page).to have_content(@author_1.name)

    within "#book-#{@book_1.id}-container" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_1.publish_year)
      expect(page).to have_content(@book_1.page_count)
      expect(page).to have_content(@author_2.name)

      expect(page).to have_content(@user_1.name)
      expect(page).to have_content(@review_1.title)
      expect(page).to have_content("Rating: #{@review_1.rating}")

    end

    within "#book-#{@book_2.id}-container" do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content(@book_2.publish_year)
      expect(page).to have_content(@book_2.page_count)
    end

    click_on @author_2.name

    expect(current_path).to eq(author_path(@author_2))
    expect(page).to have_content(@book_1.title)
  end


#   As a Visitor,
# When I visit an author's show page,
# Next to each book written by that author
# I should see one of the highest rated reviews
# (review should contain the title, score, and user name)
end
