class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  def layout_by_resource
    if controller_name == 'homes' && (action_name == 'contact' || action_name == 'news' ||
                                      action_name == 'intro' || action_name == 'service' ||
                                      action_name == 'menu_product' || action_name == 'general_manufacturer')
      'layout_frontend'
    else
      'application'
    end
  end
end
