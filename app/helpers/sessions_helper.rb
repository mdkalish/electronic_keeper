module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user = User.find_by(id: user_id)
    else
      @current_user = nil
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

end
