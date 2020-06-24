class PunchRecordsController < ApplicationController
    before_action :authenticate_user!

    before_action :set_punch_record, only: [:update]
    before_action :set_punch_card, only: [:index, :create, :update]

    def index
        if @punch_card
            @punch_records = @punch_card.punch_records
            @punch_record = @punch_card.open_punch_record 
        end
    end

    def create
        @punch_record = PunchRecord.create(punch_card: @punch_card, punch_in: Time.now)
        @punch_card.update(punched_out: false)
        redirect_to punch_records_path
    end

    def update
        @punch_record.update(punch_out: Time.now)
        @punch_card.update(punched_out: true)

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