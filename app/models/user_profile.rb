class UserProfile < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  def avatar_url
    if avatar.present?
      avatar.url
    else
      gravatar_url
    end
  end

  private

  def gravatar_url
    gravatar_url = "https://secure.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}"
    gravatar_check = "#{gravatar_url}.png?d=404"
    uri = URI.parse(gravatar_check)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    if response.code.to_i == 404 || response.code.to_i == 400
      'users/no_photo.png'
    else
      "#{gravatar_url}?s=150"
    end
  end


end
