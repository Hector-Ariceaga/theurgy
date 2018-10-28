module UserHelper
  def admin?(user)
    if !!user.admin
      "ADMIN"
    end
  end

  def admin_logged_in?
    logged_in? && !!current_user.admin
  end

end