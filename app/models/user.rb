class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_one :punch_card
    
    def full_name
      return first_name if last_name.blank?
      return last_name if first_name.blank?
      
      first_name + ' ' + last_name
    end
end
