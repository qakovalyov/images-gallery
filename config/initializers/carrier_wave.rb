CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJSRUWYZEJQ5SVTRA',
      :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'cats-images-test'
end