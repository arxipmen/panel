class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  private
  def render_404
    render html: '<h1>Page not found</h1><br>'.html_safe, status: 404
  end
end
