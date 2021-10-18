# frozen_string_literal: false

module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :profile_image)
    end
  end
end
