class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def require_admin
    current_user && current_user.admin?
  end
end
