require 'rails_helper'

RSpec.describe PunchCard, type: :model do
    it "has a valid factory" do
        expect(FactoryBot.build(:punch_card)).to be_valid
    end

    describe "punch records attribute" do
        it "has many punch records" do
            should respond_to(:punch_records)
        end
    end

    describe "user attribute" do
        it "cannot be nil" do
            expect(FactoryBot.build(:punch_card, user: nil)).to_not be_valid
        end
    end
end
