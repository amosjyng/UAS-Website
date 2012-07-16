module SessionsHelper
  def sign_in(officer)
    cookies.permanent[:remember_token] = officer.remember_token
    self.current_user = officer
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    return !current_user.nil?
  end

  def current_user=(officer)
    @current_user = officer
  end

  def current_user
    @current_user ||= Officer.find_by_remember_token(cookies[:remember_token])
  end
end
