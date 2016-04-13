class RegistrationsController < Devise::RegistrationsController

	private

  def sign_up_params
    params.require(:user).permit(:first_name,:office_location ,:last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :office_location,:email, :password, :password_confirmation,:role, :current_password)
  end
end
