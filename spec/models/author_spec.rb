require "rails_helper"

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
  describe 'relationships' do
    it { should have_many(:books) }
  end

end
