require "rails_helper"

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
  describe 'relationships' do
    it { should have_many(:books) }
  end
  describe 'instance methods' do
    it "titleizes the name" do
      author_1 = Author.new(name: "arthur")
      author_1.titleize_name
      expect(author_1.name).to eq("Arthur")
    end
    it ".top_review" do  
      author_1 = Author.create!(name: "arthur")
      book_1 = author_1.books.create!(title: "Your Baby Will Be Fine", page_count: 201, publish_year: 2002)
      user_1 = User.create!(name: "user_1")
      user_2 = User.create!(name: "user_2")
      review_1 =  user_1.reviews.create!(title: "Good!", text: "Liked it!", rating: 5, book:  book_1)
      review_2 =  user_2.reviews.create!(title: "Bad!", text: "Didn't Like it!", rating: 1, book: book_1)

    end
  end
end
