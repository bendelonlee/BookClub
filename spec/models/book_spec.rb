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

    describe '.get_reviews' do
      before(:each) do
        @book_1 = Book.create!(title: "Harry Potter 1", page_count: 300, publish_year: 2007 )

        @user_1 = User.create!(name: "magicfan1")
        @user_2 = User.create!(name: "magicfan2")
        @user_3 = User.create!(name: "magicfan3")
        @user_4 = User.create!(name: "magicfan4")
        @user_5 = User.create!(name: "magicfan5")
        @user_6 = User.create!(name: "magicfan6")

        @review_1 = Review.create!(user: @user_1, rating: 4, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )
        @review_2 = Review.create!(user: @user_2, rating: 2, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )
        @review_3 = Review.create!(user: @user_3, rating: 0, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )
        @review_4 = Review.create!(user: @user_4, rating: 1, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )
        @review_5 = Review.create!(user: @user_5, rating: 3, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )
        @review_6 = Review.create!(user: @user_6, rating: 5, book: @book_1, title: "It was a book",  text: "It's really hard to describe, you know?" )


      end
      it 'returns top three descending' do
        expected = [@review_6,@review_1,@review_5]

        expect(@book_1.get_reviews(:top, 3)).to eq(expected)
      end
      it 'returns bottom three ascending' do
        expected = [@review_3,@review_4,@review_2]
        
        expect(@book_1.get_reviews(:bottom, 3)).to eq(expected)
      end
    end
 end

 describe 'class methods' do

   describe '.rated_books' do
     before(:each) do
       @book_1 = Book.create!(title: "Harry Potter 1", page_count: 300, publish_year: 2007 )
       @book_2 = Book.create!(title: "Harry Potter 2", page_count: 300, publish_year: 2007 )
       @book_3 = Book.create!(title: "Harry Potter 3", page_count: 300, publish_year: 2007 )
       @book_4 = Book.create!(title: "Harry Potter 4", page_count: 300, publish_year: 2007 )
       @book_5 = Book.create!(title: "Harry Potter 5", page_count: 300, publish_year: 2007 )
       @book_6 = Book.create!(title: "Harry Potter 6", page_count: 300, publish_year: 2007 )

       @user_1 = User.create!(name: "magicfan1")
       @user_2 = User.create!(name: "magicfan2")

       @sorted_books_desc = [@book_3, @book_1, @book_2, @book_6, @book_4, @book_5]

       @review_1 = Review.create!(book: @book_3, user: @user_1, rating: 5, title: "It was a book",  text: "It's really hard to describe, you know?" )
       @review_2 = Review.create!(book: @book_1, user: @user_1, rating: 5, title: "It was a book",  text: "It's really hard to describe, you know?" )
       @review_3 = Review.create!(book: @book_2, user: @user_1, rating: 4, title: "It was a book",  text: "It's really hard to describe, you know?" )
       @review_4 = Review.create!(book: @book_6, user: @user_1, rating: 3, title: "It was a book",  text: "It's really hard to describe, you know?" )
       @review_5 = Review.create!(book: @book_4, user: @user_1, rating: 2, title: "It was a book",  text: "It's really hard to describe, you know?" )
       @review_6 = Review.create!(book: @book_5, user: @user_1, rating: 1, title: "It was a book",  text: "It's really hard to describe, you know?" )

       @review_7 = Review.create!(book: @book_1, user: @user_2, rating: 4, title: "It was a book",  text: "It's really hard to describe, you know?" )
     end
     it 'returns top three descending' do
       expected = [
         [@sorted_books_desc[0].title, 5],
         [@sorted_books_desc[1].title, 4.5],
         [@sorted_books_desc[2].title, 4]
      ]
       expect(Book.rated_books(:top, 3)).to eq(expected)
     end
     it 'returns bottom three ascending' do
       expected = [
         [@sorted_books_desc[5].title, 1],
         [@sorted_books_desc[4].title, 2],
         [@sorted_books_desc[3].title, 3]
      ]
       expect(Book.rated_books(:bottom, 3)).to eq(expected)
     end
   end
 end
end
