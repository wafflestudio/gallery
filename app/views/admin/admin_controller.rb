class Admin::AdminController < ApplicationController
  before_filter :is_admin?
  skip_before_filter :init_session

  layout 'admin'

  def index #dashboard
    'Dashboard here'
  end

  protected
  def init_session(admin_id)
    session[:admin] = admin_id
  end

  def is_admin?
    if session[:admin].nil?
      flash[:warning] = "Login first"
      redirect_to admin_login_path
      false
    else
      true
    end
  end
end
