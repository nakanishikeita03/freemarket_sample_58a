class ApplicationController < ActionController::Base
  # before_action :basic_auth
  # protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  # private


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '5a8a'
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(nickname f_name_kanji l_name_kanji f_name_kana l_name_kana birthday))
  end

end

