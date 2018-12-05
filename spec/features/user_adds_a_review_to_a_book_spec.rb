describe 'user_adds_a_review_to_a_book' do
  describe 'visitor navigates to a books show page' do
    it 'links them to a page where they can create a book' do
      book_1 = Book.create!(page_count: 123, title: "Yes, You Will Do It")

      visit book_path(book_1.id)

      click_on "Add a Review"

      expect(current_path).to eq(new_book_path)

      review_title = "He Was Right!"
      review_text = "He told me I would do it. I didn't believe him. I should have though, because guess what I did it!!!!"

      fill_in "review[title]", with: review_title
      fill_in "review[user]", with: "bob jr."
      find('input[value="5"]', visible: false).click
      fill_in "review[text]", with: review_text
      click_on "Submit Review"

      expect(current_path).to eq(book_path(book_1.id))

      expect(page).to have_content(review_title)
      expect(page).to have_content(review_text)
      expect(page).to have_content("Bob Jr.")
      expect(page).to have_content("5")
    end
  end
end


# As a Visitor,
# When I visit a book's show page
# I see a link to add a new review for this book.
# When I click on this link, I am taken to a new review path.
# On this new page, I see a form where I can enter:
# - a review title
# - my username as a string
# - a numeric rating that can only be a number from 1 to 5
# - some text for the review itself
# When the form is submitted, I should return to that book's
# show page and I should see my review text.
#
# User names should be converted to Title Case before saving.
# User names should be unique within the system.
