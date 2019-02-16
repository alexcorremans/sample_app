if Rails.env.test?
  CarrierWave.configure do |config|
    config_enable_processing = false
  end
end