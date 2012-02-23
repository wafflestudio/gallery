class Admin::AdminController < ApplicationController
  before_filter :is_admin?
  layout 'admin'

  def index

  end



  private
  def is_admin?
    if current_member.nil?
      redirect_to new_member_session_path
    else
      if current_member.admin
        true
      else
        false
        flash[:error] = "Admin account is required"
        redirect_to root_path
      end
    end
  end

end
