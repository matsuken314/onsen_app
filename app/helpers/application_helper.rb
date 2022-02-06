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
  BASIC_TITLE = "ととのい".freeze
  def full_title(page_title)
    if page_title.blank?
      BASIC_TITLE
    else
      "#{page_title} - #{BASIC_TITLE}"
    end
  end
end
