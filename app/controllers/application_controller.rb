class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception 
  before_action :set_request_variant
  def index
    request.user_agent       #=> "Mozilla/5.0 (Macintosh; ..."
    request.device_type      #=> :pc
    request.os               #=> "Mac OSX"
    request.browser          #=> "Chrome"
    request.from_pc?         #=> true
    request.from_smartphone? #=> false
  end
  private
    def set_request_variant
    request.variant = :pc
    end
end
