class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_administrator_role
  
  def index
  @users = User.find(:all, :order => 'created_at DESC').paginate(:page => params[:page], :per_page => 50)
    respond_to do |format|
      format.html
      format.csv  { send_data User.csv(@users), type: 'text/csv; charset=shift_jis', filename: "users.csv" }
    end
  end
end
