class ProfileUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
