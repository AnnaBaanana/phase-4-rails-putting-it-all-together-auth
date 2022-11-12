class User < ApplicationRecord
    has_secure_password
    has_many :recipes

    validates :password_digest, presence: true
    validates :password_digest, uniqueness: true

end
