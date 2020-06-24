class PunchCardsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_punch_card, only: [:index, :show, :punch_in, :punch_out]
    
    def index
    end

    def create
        @punchCard = PunchCard.create(user: current_user)

        redirect_to punch_records_path
    end

    private

    def set_punch_card
        @punch_card = PunchCard.find(params[:id])
    end

    def punch_card_params
        params.require(:punch_card).permit(:user_id)
    end
end