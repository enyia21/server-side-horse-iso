class UserSerializer < ApplicationSerializer
    attributes :id, :username, :email, :first_name, :last_name
    has_many :horses
    has_many :reviews
end