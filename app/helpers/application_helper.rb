module ApplicationHelper
  BASIC_TITLE = "ととのい".freeze
  def full_title(page_title)
    if page_title.blank?
      BASIC_TITLE
    else
      "#{page_title} - #{BASIC_TITLE}"
    end
  end

  def og_description(page_description = "")
    base_description = "ととのいはサ活（サウナ活動）の記録を管理することに特化したサービスです。"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end

  # イメージ画像
  def og_image(page_image = "")
    base_image = "#{root_url}images/ogp_default.JPG"
    if page_image.empty?
      base_image
    else
      page_image
    end
  end
end
