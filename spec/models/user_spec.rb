require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  describe "full name" do
    it 'should return the first name when last name is blank' do
      expect(FactoryBot.build(:user, first_name: 'first name', last_name: '').full_name).to eq('first name')
    end
    
    it 'should return the last name when first name is blank' do
      expect(FactoryBot.build(:user, first_name: '', last_name: 'last name').full_name).to eq('last name')
    end
    
    it 'should return the concatenation of first_name and last_name separated by a space character' do
      expect(FactoryBot.build(:user, first_name: 'first name', last_name: 'last name').full_name).to eq('first name last name')
    end
  end
end
