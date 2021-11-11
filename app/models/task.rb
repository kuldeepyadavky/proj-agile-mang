class Task < ApplicationRecord
  has_many :comments
  has_many :sub_tasks
  belongs_to :project
  belongs_to :user
end
