class User < ApplicationRecord
    mount_uploader :profile, ImageUploader
    has_secure_password
end
