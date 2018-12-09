require "rails_helper"

describe 'User Reviews Sorting' do
  before :each do
    @user = User.create!(name: Faker::Name.unique.name)

    @book = Book.create!(title: Faker::Book.unique.title, page_count: rand(900), publish_year: rand(1950..2018))
    @review_1 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)
    @review_2 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)
    @review_3 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)
    @review_4 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)
    @review_5 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)
    @review_6 = @book.reviews.create!(title: "#{Faker::App.name} #{Faker::Ancient.god}", rating: rand(1..5), user_id: @user.id, text: Faker::RickAndMorty.quote)

    visit user_path(@user)
  end

  it 'should sort reviews by rating ascending and date ascending' do
    page.select("Ascending", from: "By Rating")
    page.select("Ascending", from: "By Date")

    click_button "Sort"

    expect(current_path).to eq(user_path(@user))
  end
  xit 'should sort reviews by rating ascending and date descending' do

  end
  xit 'should sort reviews by rating descending and date ascending' do

  end
  xit 'should sort reviews by rating descending and date descending' do

  end
end
