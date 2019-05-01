require 'bcrypt'

class User < ApplicationRecord
    validates :username, :session_token, presence: true
    validates :password_digest, presence: { message: 'password can not be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }

    def password=(input_password)
        @password = input_password
        self.password_digest = BCrypt::Password.create(input_password)
    end

    def is_password?(input_password)
        BCrypt::Password.new(self.password_digest).is_password?(input_password)
    end
end
