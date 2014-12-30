class SessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = t('flash.invalid_user_or_password')
      render 'new'
    end
  end

  def destroy
    # binding.pry
    current_user.tickets.where(status:"open").destroy_all
    current_user.tickets.update_all(status:"closed", closed_at: Time.now)
    session.destroy
    flash[:success] = t('flash.logged_out_successfully')
    redirect_to login_path
  end

end
