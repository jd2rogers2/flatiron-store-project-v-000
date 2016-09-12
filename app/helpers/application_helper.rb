module ApplicationHelper

  def is_logged_in?
    true if current_user
  end

  # def current_user
  #   User.find_by(id: session[:uid])
  # end
end
