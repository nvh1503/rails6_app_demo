class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def check_permission
    return redirect_to root_path unless current_user.user_type.teacher?
  end
end
