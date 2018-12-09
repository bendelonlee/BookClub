require "rails_helper"

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
  describe 'relationships' do
    it { should have_many(:reviews) }
  end
  describe 'class methods' do
    it '.top_users_by_reviews' do
      user_1 = User.create!(name: 'Bob')
      user_2 = User.create!(name: 'Barb')
      user_3 = User.create!(name: 'Bell')

      book_1 = Book.create!(title: 'Oh joy', page_count: 200, publish_year: 2012)
      book_1.reviews.create!(title: "Wow.", rating: 5, user_id: user_1.id, text: "This book flew by! It was amazing!")
      book_1.reviews.create!(title: "Boo.", rating: 1, user_id: user_2.id, text: "This book took too long to read! It was bad!")
      book_1.reviews.create!(title: "Wow, compelling.", rating: 3, user_id: user_2.id, text: "This book flew by! It was amazing!")
      book_1.reviews.create!(title: "Boo, mediocore.", rating: 2, user_id: user_1.id, text: "This book took too long to read! It was bad!")
      book_1.reviews.create!(title: "Boo, crappy.", rating: 2, user_id: user_3.id, text: "This book took too long to read! It was bad!")

      expect(User.top_users_by_reviews).to eq([
        [user_2.id, user_2.name, user_2.reviews.count],
        [user_1.id, user_1.name, user_1.reviews.count],
        [user_3.id, user_3.name, user_3.reviews.count]
        ])
      expect(User.top_users_by_reviews(2)).to eq([
        [user_2.id, user_2.name, user_2.reviews.count],
        [user_1.id, user_1.name, user_1.reviews.count]
        ])
    end
  end
end
