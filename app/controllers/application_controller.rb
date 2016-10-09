class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 #  if params[:cart].blank? then 
 #  	if params[:cart].include? "true"
 #  		before_action :authenticate_user!
	# end
 #  end
end
