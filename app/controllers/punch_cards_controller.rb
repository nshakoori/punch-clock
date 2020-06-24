class PunchCardsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @punch_card = PunchCard.new(user: current_user)
        if @punch_card.save
            redirect_to punch_records_path
        else
            flash[:error] = "Couldn't create a Punch Card"
            redirect_to root_path
        end
    end

    private

    def punch_card_params
        params.require(:punch_card).permit(:user_id)
    end
end