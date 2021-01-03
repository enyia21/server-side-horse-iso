class HorsesShowSerializer < ApplicationSerializer
  attributes :id, :name, :location, :gender, :size, :color, :foal_date, :profile_picture, :video, :temperment, :description
  belongs_to :user
  belongs_to :breed
end
