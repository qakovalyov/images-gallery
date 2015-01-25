class AvatarUploader < AssetUploader

  include CarrierWave::MiniMagick

  process :resize_to_fill => [150, 150]

end
