class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by email:params[:session][:email].downcase
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      params[:session][:remember_me] == "1" ? remember(admin) : forget(admin)
      redirect_to users_path
    else
      flash.now[:danger] = t "flash.invalid_login"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
