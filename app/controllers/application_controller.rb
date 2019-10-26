class ApplicationController < ActionController::Base
  

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :require_user

  def errors_message(obj)
    message = ""
    i = 0
    obj.errors.messages.each do |key, value|
      i += 1
      message += "(#{i}) #{value.first}"
    end
    return message
  end

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as mobile.
      (request.user_agent =~ /(iPhone|iPod|Android|webOS|Mobile)/) || (request.user_agent =~ /(tablet|ipad)|(android(?!.*mobile))/i)
    end
  end
  helper_method :mobile_device?
  

  protected

  def configure_permitted_parameters
    added_attrs = [ :cpf, :email, :name, :password, :password_confirmation, :remember_me ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def require_user
    if !current_user
      redirect_to root_path
    end
  end

end