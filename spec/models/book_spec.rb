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

    describe '.sort_reviews' do
      before :each do
        user = User.create!(name: 'Bell')

        @book_1 = Book.create!(title: 'Oh joy', page_count: 200, publish_year: 2012)
        @rev_1 = @book_1.reviews.create!(title: "Wow.", rating: 5, user_id: user.id, text: "This book flew by! It was amazing!", created_at: 1.days.ago)
        @rev_2 = @book_1.reviews.create!(title: "Boo.", rating: 1, user_id: user.id, text: "This book took too long to read! It was bad!", created_at: 2.days.ago)
        @rev_3 = @book_1.reviews.create!(title: "Wow, compelling.", rating: 3, user_id: user.id, text: "This book flew by! It was amazing!", created_at: 3.days.ago)
        @rev_4 = @book_1.reviews.create!(title: "Boo, mediocore.", rating: 2, user_id: user.id, text: "This book took too long to read! It was bad!", created_at: 4.days.ago)
        @rev_5 = @book_1.reviews.create!(title: "Boo, crappy.", rating: 2, user_id: user.id, text: "This book took too long to read! It was bad!", created_at: 5.days.ago)
      end
      it 'should sort reviews by rating ascending and date ascending' do
        sort_params = {rating: "asc", date: "asc"}
        sorted = @book_1.sort_reviews(sort_params)

        expect(sorted).to eq(@book_1.reviews.order("rating asc, reviews.created_at asc"))
      end
      it 'should sort reviews by rating ascending and date descending' do
        sort_params = {rating: "asc", date: "desc"}
        sorted = @book_1.sort_reviews(sort_params)

        expect(sorted).to eq(@book_1.reviews.order("rating asc, reviews.created_at desc"))
      end
      it 'should sort reviews by rating descending and date ascending' do
        sort_params = {rating: "desc", date: "asc"}
        sorted = @book_1.sort_reviews(sort_params)

        expect(sorted).to eq(@book_1.reviews.order("rating desc, reviews.created_at asc"))
      end
      it 'should sort reviews by rating descending and date descending' do
        sort_params = {rating: "desc", date: "desc"}
        sorted = @book_1.sort_reviews(sort_params)

        expect(sorted).to eq(@book_1.reviews.order("rating desc, reviews.created_at desc"))
      end
   end
 end
end
