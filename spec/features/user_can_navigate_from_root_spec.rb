require "rails_helper.rb"

describe 'Root page navigation' do
  context 'as a user' do
    it 'should have a nav with working links' do
      visit "/"

      within "nav" do
        click_on("Book Club")
      end
      expect(current_path).to eq("/")
      within "nav" do
        click_on("All Books")
      end
      expect(current_path).to eq("/books")
      within "nav" do
        click_on("All Authors")
      end
      expect(current_path).to eq("/authors")
    end
  end
end
