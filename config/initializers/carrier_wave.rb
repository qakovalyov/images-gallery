CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAICPC4DVT6LU4342Q',
      :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'cats-gallery-test'
end