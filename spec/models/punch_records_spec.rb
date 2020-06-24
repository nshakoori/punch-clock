require 'rails_helper'

RSpec.describe PunchRecord, type: :model do
    it "has a valid factory" do
        expect(FactoryBot.build(:punch_record)).to be_valid
    end

    describe "punch card attribute" do
        it "cannot be nil" do
            expect(FactoryBot.build(:punch_record, punch_card: nil)).to_not be_valid
        end
    end

    describe "punch_in attribute" do
        it "cannot be nil" do
            expect(FactoryBot.build(:punch_record, punch_in: nil)).to_not be_valid
        end
    end
end
