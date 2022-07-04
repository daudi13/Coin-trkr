class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message unless current_user.nil?
    redirect_to new_user_session_path, alert: exception.message
  end
end
