require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PunchCardsController, :type => :controller do
    describe "GET create" do
        context "authenticated user" do
            login_user

            it "should create a new punch card" do
                expect { get :create }.to change{PunchCard.count}.by(1)
            end
        end

        context "not authenticated user" do
            it "should not create a new punch card" do
                expect { get :create }.to change{PunchCard.count}.by(0)
            end
        end
    end
end