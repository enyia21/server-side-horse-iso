class Horse < ApplicationRecord
    belongs_to :user
    belongs_to :breed
    has_many :reviews, :dependent => :delete_all
end
