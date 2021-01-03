class User < ApplicationRecord
    has_secure_password
    has_many :horses
    has_many :breeds, through: :horses
    has_many :reviews
end
