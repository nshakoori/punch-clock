class PunchRecordsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_punch_record, only: [:punch_out]
    before_action :set_punch_card, only: [:index, :create, :punch_out]

    def index
        if @punch_card
            @punch_records = @punch_card.punch_records
            @punch_record = @punch_card.open_punch_record
        else
            redirect_to root_path
        end
    end

    def create
        @punch_record = PunchRecord.new(punch_card: @punch_card, punch_in: Time.now)

        unless @punch_record.save  && @punch_card.update(punched_out: false)
            flash[:error] = "Couldn't punch you in"
        end

        redirect_to punch_records_path
    end

    def punch_out
        unless @punch_record.update(punch_out: Time.now) &&  @punch_card.update(punched_out: true)
            puts "----- got error"
            flash[:error] = "Couldn't punch you out"
        end

        redirect_to punch_records_path
    end
    
    private

    def set_punch_record
        @punch_record = PunchRecord.find(params[:id])
    end

    def set_punch_card
        @punch_card = current_user.punch_card
    end

    def punch_records_params
        params.permit(:id, :punch_in, :punch_out)
    end
end