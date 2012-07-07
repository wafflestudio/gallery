require 'digest/sha2'
class Admin::AuthController < Admin::AdminController
  skip_before_filter :is_admin?, :only => [:login, :authorize]

  def login
    unless session[:admin].nil?
      redirect_to admin_path
    end
  end

  def authorize
    login = params[:login]
    password = params[:password]
    #open file
    f = File.open(Rails.root + "config/admin.yml", "r")
    admins = YAML::load f.read
    f.close

    #find
    admin = admins.find {|admin| admin[:id] == login}

    unless admin.nil?
      #match password
      if admin[:password_hash] == Digest::SHA512.hexdigest(password + admin[:password_salt])
        # login succeeded
        flash[:success] = "Login Succeeded."
        init_session(login)
        redirect_to admin_path
      else
        flash[:error] = "Password incorrect."
        redirect_to admin_login_path
      end
    else
      flash[:error] = "Admin \"#{login}\" doesn't exist"
      redirect_to admin_login_path
    end
  end

  def logout
    flash[:success] = "Logout Succeeded."
    session[:user_id] = nil
    reset_session
    redirect_to admin_path
  end
end
