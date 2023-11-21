module FormHelper
  def setup_profile(profile)
    profile.address ||= Address.new
    (3 - profile.hobbies.size).times { profile.hobbies.build }
    profile
  end
end
