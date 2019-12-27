dule V1
  class PasswordsController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:create]

    def create
      user = User.find_by(email: create_params[:email])
      user&.send_reset_password_instructions
      render json: {}
    end

    private

    def create_params
      params.require(:user).permit(:email)
    end
  end
end
