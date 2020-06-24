class HomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        if current_user.punch_card
          redirect_to punch_records_path
        end
    end
  end
  