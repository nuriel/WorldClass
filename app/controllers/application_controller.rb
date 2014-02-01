class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_last_request_at
  after_filter :store_location

  # spoof local ip
  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '66.140.188.68'
    else
      request.remote_ip
    end
  end

  def current_user_is_teacher
    current_user && current_user.is_teacher
  end

  private
  # https://groups.google.com/forum/#!topic/plataformatec-devise/tOKU_jcWNp0
  def set_last_request_at
    current_user.update_attribute(:ip, '66.140.188.68') if user_signed_in?
  end

  def store_location
    if current_user && params[:user].present? && params[:user][:lat].present?
      current_user.lat = params[:user][:lat]
      current_user.lng = params[:user][:lng]
    end
  end

end
