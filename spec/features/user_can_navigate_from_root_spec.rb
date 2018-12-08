require "rails_helper.rb"

describe 'Root page navigation' do
  context 'as a user' do
    it 'should have a nav with working links' do
      visit "/"

      within "nav" do
        click_link("Book Club")
      end
      expect(current_path).to eq("/")
      within "nav" do
        click_link("All Books")
      end
      expect(current_path).to eq("/books")
      within "nav" do
        click_link("All Authors")
      end
      expect(current_path).to eq("/authors")
    end
  end
end
