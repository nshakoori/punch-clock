class UserController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user only: [:index, :delete]

    def delete
    
    end
    
    private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end