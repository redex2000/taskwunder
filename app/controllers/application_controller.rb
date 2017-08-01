class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  def after_sign_in_path_for(resource)
    if resource.respond_to?(:admin?) && resource.admin?
      users_path
    else
      site_welcome_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referer
  end
end
