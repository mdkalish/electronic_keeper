module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

end
