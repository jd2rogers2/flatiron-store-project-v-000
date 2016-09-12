module ApplicationHelper

  def is_logged_in?
    # binding.pry
    session.has_key?(:uid)
  end

  def current_user
    User.find_by(id: session[:uid])
  end
end
