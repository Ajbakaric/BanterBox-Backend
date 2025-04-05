class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session

  respond_to :json

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Allow extra params for Devise user actions
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end

  # Override Devise method to handle unauthorized access in API
  def authenticate_user!(opts = {})
    unless user_signed_in?
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
