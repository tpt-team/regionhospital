class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :medium do
    process eager: true
    process resize_to_fill: [250, 250, :center]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end
end
