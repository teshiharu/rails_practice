class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception # CSRFチェック対策(？)らしい



  layout 'application'
  def index
    render template: :root
  end
end
