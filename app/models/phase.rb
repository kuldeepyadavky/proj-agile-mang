class Phase < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: :true
    validates_length_of :title, minimum: 5, maximum: 255
end
