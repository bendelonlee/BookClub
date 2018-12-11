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

  it 'should sort reviews by rating ascending (date ascending)' do
    within "#sort-by-rating" do
      page.select("asc", from: "rating[direction]")
      click_button "Sort"
    end

    sorted = @user.reviews.order("rating asc, reviews.created_at asc")
    expect(all('.review')[0]).to have_content(sorted[0].title, sorted[0].text)
    expect(all('.review')[1]).to have_content(sorted[1].title, sorted[1].text)
    expect(all('.review')[2]).to have_content(sorted[2].title, sorted[2].text)
    expect(all('.review')[3]).to have_content(sorted[3].title, sorted[3].text)
    expect(all('.review')[4]).to have_content(sorted[4].title, sorted[4].text)
    expect(all('.review')[5]).to have_content(sorted[5].title, sorted[5].text)
  end
  it 'should sort reviews by rating descending (date descending)' do
    within "#sort-by-rating" do
      page.select("desc", from: "rating[direction]")
      click_button "Sort"
    end

    click_button "Sort"

    sorted = @user.reviews.order("rating desc, reviews.created_at desc")
    expect(all('.review')[0]).to have_content(sorted[0].title, sorted[0].text)
    expect(all('.review')[1]).to have_content(sorted[1].title, sorted[1].text)
    expect(all('.review')[2]).to have_content(sorted[2].title, sorted[2].text)
    expect(all('.review')[3]).to have_content(sorted[3].title, sorted[3].text)
    expect(all('.review')[4]).to have_content(sorted[4].title, sorted[4].text)
    expect(all('.review')[5]).to have_content(sorted[5].title, sorted[5].text)
  end

end
