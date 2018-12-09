require "rails_helper"

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:page_count) }
    it { should validate_uniqueness_of(:title).case_insensitive }
  end
  describe 'relationships' do
    it { should have_many(:authors) }
    it { should have_many(:reviews) }
  end

  describe 'instance methods' do
    it "titleizes the title" do
      book_1 = Book.new(title: "hey you", page_count: 134)
      book_1.titleize_title
      expect(book_1.title).to eq("Hey You")
    end

    it '.average_review' do
      user = User.create!(name: "Egress Mcgovern")
      book_1 = Book.create!(title: "it's me", page_count: 134)
      book_1.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love", user_id: user.id)
      book_1.reviews.create!(title: "Too much", rating: 1, text: "This book was too much for me", user_id: user.id)

      expect(book_1.average_review).to eq(3)
    end

    it ".top_review" do
      book_1 = Book.create!(title: "Your Baby Will Be Fine", page_count: 201, publish_year: 2002)
      user_1 = User.create!(name: "user_1")
      user_2 = User.create!(name: "user_2")
      review_1 =  user_1.reviews.create!(title: "Good!", text: "Liked it!", rating: 5, book:  book_1)
      review_2 =  user_2.reviews.create!(title: "Bad!", text: "Didn't Like it!", rating: 1, book: book_1)
      expect(book_1.top_review).to eq(review_1)
    end
 end
end
