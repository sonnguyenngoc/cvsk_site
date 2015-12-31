class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #before_action :authenticate_user!
  protect_from_forgery with: :exception
  
  protected
  def layout_by_resource
    if controller_name == 'homes' && (action_name == 'contact' || action_name == 'news' ||
                                      action_name == 'intro' || action_name == 'service' ||
                                      action_name == 'menu_product' || action_name == 'general_manufacturer' ||
                                      action_name == 'post_detail' || action_name == 'product_detail' ||
                                      action_name == 'manufacturer_detail' || action_name = 'reservation' ||
                                      action_name='confirm_order' || action_name='picture' || action_name='picture_detail' ||
                                      action_name='finish_order')
      'layout_frontend'
    elsif (devise_controller? && resource_name == :user && action_name != 'edit') || controller_name == 'passwords'
      'login'
    else
      authenticate_user!
      'application'
    end
  end
  
end
