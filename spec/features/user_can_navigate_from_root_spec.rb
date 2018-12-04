require "rails_helper.rb"

describe 'Root page navigation' do
  context 'as a user' do
    it 'should have a nav with working links' do
      visit "/"

      within "#homepage" do
        expect(page).to have_content("BookClub")
      end 

      within "#books" do
        expect(page).to have_content("All books")
      end

      click_link "books"

      expect(current_path).to eq("/books")

      click_link "homepage"

      expect(current_path).to eq("/")
    end
  end
end
