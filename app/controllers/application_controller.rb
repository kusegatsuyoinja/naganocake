class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    case resource
    
    when Admin
      admin_orders_path
      
    when Customer  
      public_items_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
    
    when :admin
      new_admin_session_path
      
    when :customer
      root_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_ruby, :first_ruby, :postal_code, :address, :phone_number])
  end
end
