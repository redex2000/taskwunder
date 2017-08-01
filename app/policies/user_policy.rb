class UserPolicy < ApplicationPolicy
  def send_pdf?
    user.admin?
  end
end