module ApplicationHelper
  def user_display_name(user)
    user.name.presence || user.email.split('@').first.capitalize
  end

  def user_initial(user)
    (user.name.presence || user.email).first.upcase
  end
end
