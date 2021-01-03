class BreedSerializer < ApplicationSerializer
    attributes :id, :common_name, :country
    # has_many :horses
    # has_many :users
end