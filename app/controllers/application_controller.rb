class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_user_info

  def update_user_info
    current_user.update_tracked_fields! if current_user.present?
  end

end
