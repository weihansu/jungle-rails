class Admin::DashboardController < ApplicationController

  # Require authentication only for edit and delete operation
  before_filter :authenticate

  def show
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PASSWORD']
    end
  end

end
