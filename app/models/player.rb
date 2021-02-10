class Player < ApplicationRecord
    has_many :games
    validates_uniqueness_of :username
end
