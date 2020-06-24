class PunchCard < ActiveRecord::Base
    has_many :punch_records
    belongs_to :user

    validates :user, presence: true

    def open_punch_record
        punch_records.where(punch_out: nil).last
    end
end