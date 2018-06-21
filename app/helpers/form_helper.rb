module FormHelper
  def setup_user(user)
    user.tap {|u| u.location ||= Location.new(country: "United States")}
  end
end
