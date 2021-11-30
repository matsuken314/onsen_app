module ApplicationHelper
  def avatar_url(user)
    avatar_url = if user.avatar?
                   "default_people.png"

                 elsif user.avatar?
                   "default_people.png"
                 else
                   user.avatar
                 end
  end
end
