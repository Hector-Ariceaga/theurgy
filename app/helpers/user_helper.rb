module UserHelper
  def clinic(@user)
    @user.clinic if @user.clinic
  end
end