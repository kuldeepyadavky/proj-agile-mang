class Comment < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :body, presence: :true
  validates_length_of :body, minimum: 5, maximum: 1000
end
