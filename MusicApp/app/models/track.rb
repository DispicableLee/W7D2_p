class Track < ApplicationRecord
    validates :title, presence: true
    validates :ord, presence: true, uniqueness: true
end
