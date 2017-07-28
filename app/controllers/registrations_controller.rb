class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:bio, :birth_date, :full_name, :email, :password, :password_confirmation)
  end

end