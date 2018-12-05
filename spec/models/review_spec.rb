require "rails_helper"

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:rating).with_message("is a required field") }
    it { should validate_presence_of(:text) }
  end
  describe 'relationships' do
    it { should belong_to(:book) }
  end

end
