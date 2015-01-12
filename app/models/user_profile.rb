class UserProfile < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  def avatar_url
    avatar ? avatar.url : 'users/no_photo.png'
  end

end
