helpers do

  def logged_in?
    return true if session[:id]
    false
  end

  def current_user
    @current_user ||= User.find_by_id(session[:id])
  end

  # def user_name
  #   @username ||= User.find(session[:id]).user_name
  # end

  # def email
  # end

  def start_session(user)
    session[:id] = user.id
  end

end
