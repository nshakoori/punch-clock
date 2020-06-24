class PunchRecord < ActiveRecord::Base
    belongs_to :punch_card

    validates :punch_card, presence: true
    validates :punch_in, presence: true
end