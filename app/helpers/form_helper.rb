module FormHelper
  def setup_user(user)
    user.tap {|u| u.location ||= Location.new}
  end
end
