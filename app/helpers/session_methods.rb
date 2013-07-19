helpers do
  def current_user
    session[:id]
  end

  def user_name
    session[:user_name]
  end

  def email
    session[:email]
  end

end
