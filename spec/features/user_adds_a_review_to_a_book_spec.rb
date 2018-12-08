require "rails_helper"
describe 'user_adds_a_review_to_a_book' do
  describe 'visitor navigates to a books show page' do
    before(:each) do
      @user_1 = User.create!(name: "Bob Jr.")
      author_1 = Author.create!(name: "Boy, Johnny")
      @book_1 = author_1.books.create!(page_count: 123, title: "Yes, You Will Do It", publish_year: 2012)

      visit book_path(@book_1.id)
      click_on "Add a Review"
    end
    it 'links them to a page where they can create a book' do
      expect(current_path).to eq(new_book_review_path(@book_1.id))

      expect(page).to have_content(@book_1.title)

      review_title = "He Was Right!"
      review_text = "He told me I would do it. I didn't believe him. I should have though, because guess what I did it!!!!"
      fill_in "review[title]", with: review_title
      fill_in "review[user]", with: "bob jr."
      find('input[value="5"]', visible: false).click
      fill_in "review[text]", with: review_text
      click_on "Submit Review"

      expect(current_path).to eq(book_path(@book_1.id))

      expect(page).to have_content(review_title)
      expect(page).to have_content(review_text)
      expect(page).to have_content(@user_1.name)
      expect(page).to have_content("5")
    end
    it 'gives them an error if they do not enter a title' do
      expect(current_path).to eq(new_book_review_path(@book_1.id))
      fill_in "review[user]", with: "bob jr."
      find('input[value="5"]', visible: false).click
      fill_in "review[text]", with: @review_text
      click_on "Submit Review"
      expect(page).to have_content("Title can't be blank")
    end
    it 'gives them an error if they do not enter any text' do
      expect(current_path).to eq(new_book_review_path(@book_1.id))
      fill_in "review[title]", with: @review_title
      fill_in "review[user]", with: "bob jr."
      find('input[value="5"]', visible: false).click
      click_on "Submit Review"
      expect(page).to have_content("Text can't be blank")
    end
    it 'gives them an error if they do not enter a user' do
      expect(current_path).to eq(new_book_review_path(@book_1.id))
      fill_in "review[title]", with: @review_title
      find('input[value="5"]', visible: false).click
      fill_in "review[text]", with: @review_text
      click_on "Submit Review"
      expect(page).to have_content("User must exist")
    end
    it 'gives them an error if they do not enter a rating' do
      expect(current_path).to eq(new_book_review_path(@book_1.id))
      fill_in "review[title]", with: @review_title
      fill_in "review[user]", with: "bob jr."
      fill_in "review[text]", with: @review_text
      click_on "Submit Review"
      expect(page).to have_content("Rating is a required field")
    end
  end
end
