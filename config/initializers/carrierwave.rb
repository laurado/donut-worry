CarrierWave.configure do |config|
  config.storage = :file
  config.enable_processing = false
  if !Rails.env.test?
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: "us-east-2"
    }
    config.fog_directory  = ENV["S3_BUCKET"]
  end
end
