class ReviewSerializer < ApplicationSerializer
  attributes :id, :title, :comment
  has_one :horse
  has_one :user
end
