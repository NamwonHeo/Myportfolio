class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate
  	redirect_to new_user_session_path unless user_signed_in?
  end

  def authority_forbidden(error)
  Authority.logger.warn(error.message)
  redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
end
end
