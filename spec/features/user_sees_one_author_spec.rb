require "rails_helper"
describe 'user sees the show page of one author' do
  it 'displays the authors information and the information of its books' do
    name_1 = "Doctor Wilkinson"
    name_2 = "Margo Wilkinson"
    author_1 = Author.create!(name: name_1)
    author_2 = Author.create!(name: name_2)

    title_1 = "Your Baby Will Be Fine"
    publish_year_1 = 2003
    page_count_1 = 365
    title_2 = "Your Baby Might Not Be Okay"
    publish_year_2 = 2001
    page_count_2 = 400
    book_1 = Book.create!(title: title_1, page_count: page_count_1, publish_year: publish_year_1)
    book_2 = Book.create!(title: title_2, page_count: page_count_2, publish_year: publish_year_2)

    author_1.books += [book_1, book_2]
    author_2.books += [book_1]
    visit author_path(author_1)

    expect(page).to have_content(author_1.name)

    within "#book-#{book_1.id}-container" do
      expect(page).to have_content(title_1)
      expect(page).to have_content(publish_year_1)
      expect(page).to have_content(page_count_1)
      expect(page).to have_content(name_2)
    end

    within "#book-#{book_2.id}-container" do
      expect(page).to have_content(title_2)
      expect(page).to have_content(publish_year_2)
      expect(page).to have_content(page_count_2)
    end

    click_on name_2

    expect(current_path).to eq(author_path(author_2))
    expect(page).to have_content(title_1)
  end
end
