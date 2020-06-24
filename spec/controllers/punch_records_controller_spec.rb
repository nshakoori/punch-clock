require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PunchRecordsController, :type => :controller do
    describe "GET create" do
        context "authenticated user" do
            login_user

            it "should create a new punch record when user has a card" do
                punch_card = FactoryBot.create(:punch_card, user: subject.current_user)
                punch_records = punch_card.punch_records

                expect(punch_records.count).to eq(0)

                get :create

                expect(punch_records.count).to eq(1)
                expect(punch_records[0].punch_out).to be_nil
                expect(response).to redirect_to(punch_records_path)
            end

            it "should not create a new punch record when user doesn't have a card" do
                punch_records_count = PunchRecord.count
                expect(punch_records_count).to eq(0)

                get :create
                
                expect(punch_records_count).to eq(0)
                expect(flash[:error]).to eq("Couldn't punch you in")
                expect(response).to redirect_to(punch_records_path)
            end
        end

        context "not authenticated user" do
            it "should create a new punch card when user is logged in and doesn't have a card" do
                expect { get :create }.to change{ PunchRecord.count }.by(0)
            end
        end
    end

    describe "POST punch_out" do
        context "authenticated user" do
            login_user

            it "should set punch record's punch_out time to current time" do
                punch_record = FactoryBot.create(:punch_record, punch_card: FactoryBot.create(:punch_card, user: subject.current_user, punched_out: false))
                
                post :punch_out, params: { id: punch_record.id }

                punch_record.reload

                expect(punch_record.punch_card.punched_out).to be true
                expect(flash[:error]).to be_nil
                expect(punch_record.punch_out).not_to be_nil
            end
        end

        context "not authenticated user" do
            it "should create a new punch card when user is logged in and doesn't have a card" do
                expect { get :create }.to change{ PunchRecord.count }.by(0)
            end
        end
    end
end