class Breed < ApplicationRecord
    has_many :horses
    has_many :users, through: :horses
end
