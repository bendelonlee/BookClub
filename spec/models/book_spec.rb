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

    it '.review_average' do
      user = User.create!(name: "Egress Mcgovern")
      book_1 = Book.create!(title: "it's me", page_count: 134)
      book_1.reviews.create!(title: "So lovely", rating: 5, text: "I love how they fell in love", user_id: user.id)
      book_1.reviews.create!(title: "Too much", rating: 1, text: "This book was too much for me", user_id: user.id)

      expect(book_1.average_rating).to eq(3)
    end
  end
end
