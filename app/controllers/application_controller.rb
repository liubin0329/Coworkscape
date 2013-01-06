class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_uri
  http_basic_authenticate_with :name => "test", :password => "coworkscape" if Rails.env != "production"
  
  def check_administrator_role
      @user = User.find(current_user)
      if @user.admin != true
        redirect_to(root_path)
      end
  end
  
  protected
  
  def check_uri
  redirect_to request.protocol + "www." + request.host_with_port + request.fullpath if request.subdomain.empty? && request.host_with_port != "localhost:3000"
  if current_user
  @user = User.find(current_user)
  end
  
  end
end
