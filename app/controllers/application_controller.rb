class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_admin, only: [:admin_panel]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_admin
    redirect_to root_path, alert: "У вас немає прав доступу" unless current_user.admin?
  end
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone])
  end
end
