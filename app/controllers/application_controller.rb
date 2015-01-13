class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end


  def after_sign_in_path_for(resource)
    if resource.superadmin?
      admin_dashboard_path
    else
      root_path
    end
  end

  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :phone
    devise_parameter_sanitizer.for(:account_update) << :name << :phone

  end

end
