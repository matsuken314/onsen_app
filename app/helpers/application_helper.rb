module ApplicationHelper
  def avatar_url(user)
    avatar_url = if user.profile_photo.nil?
                   "default_people.png"

                 elsif user.profile_photo.blank?
                   "default_people.png"
                 else
                   user.profile_photo
                 end
  end
end
