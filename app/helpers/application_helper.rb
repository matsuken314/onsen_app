module ApplicationHelper
  def avatar_url(user)
    return user.profile_photo unless user.profile_photo.nil?

    gravatar_id = Digest::MD5.hexdigest(user.email).downcase
    "https://techpit-market-prod.s3.amazonaws.com/uploads/part_attachment/file/15782/2da91636-af73-4eed-91cd-320a0399609c.jpg"
  end
end
