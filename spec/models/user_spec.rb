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
        [user_2.name, user_2.reviews.count],
        [user_1.name, user_1.reviews.count],
        [user_3.name, user_3.reviews.count]
        ])
      expect(User.top_users_by_reviews(2)).to eq([
        [user_2.name, user_2.reviews.count],
        [user_1.name, user_1.reviews.count]
        ])
    end
  end

  describe '.sort_reviews' do
    before :each do
      @user = User.create!(name: 'Bell')

      @book_1 = Book.create!(title: 'Oh joy', page_count: 200, publish_year: 2012)
      @rev_1 = @book_1.reviews.create!(title: "Wow.", rating: 5, user_id: @user.id, text: "This book flew by! It was amazing!", created_at: 1.days.ago)
      @rev_2 = @book_1.reviews.create!(title: "Boo.", rating: 1, user_id: @user.id, text: "This book took too long to read! It was bad!", created_at: 2.days.ago)
      @rev_3 = @book_1.reviews.create!(title: "Wow, compelling.", rating: 3, user_id: @user.id, text: "This book flew by! It was amazing!", created_at: 3.days.ago)
      @rev_4 = @book_1.reviews.create!(title: "Boo, mediocore.", rating: 2, user_id: @user.id, text: "This book took too long to read! It was bad!", created_at: 4.days.ago)
      @rev_5 = @book_1.reviews.create!(title: "Boo, crappy.", rating: 2, user_id: @user.id, text: "This book took too long to read! It was bad!", created_at: 5.days.ago)
    end
    it 'should sort reviews by rating ascending and date ascending' do
      sort_params = {rating: "asc", date: "asc"}
      sorted = @user.sort_reviews(sort_params)

      expect(sorted).to eq(@user.reviews.order("rating asc, reviews.created_at asc"))
    end
    it 'should sort reviews by rating ascending and date descending' do
      sort_params = {rating: "asc", date: "desc"}
      sorted = @user.sort_reviews(sort_params)

      expect(sorted).to eq(@user.reviews.order("rating asc, reviews.created_at desc"))
    end
    it 'should sort reviews by rating descending and date ascending' do
      sort_params = {rating: "desc", date: "asc"}
      sorted = @user.sort_reviews(sort_params)

      expect(sorted).to eq(@user.reviews.order("rating desc, reviews.created_at asc"))
    end
    it 'should sort reviews by rating descending and date descending' do
      sort_params = {rating: "desc", date: "desc"}
      sorted = @user.sort_reviews(sort_params)

      expect(sorted).to eq(@user.reviews.order("rating desc, reviews.created_at desc"))
    end
 end
end
