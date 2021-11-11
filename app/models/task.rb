class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :sub_tasks, dependent: :destroy
  belongs_to :project
  belongs_to :user
  belongs_to :task
  validates :title, :description, :due_date, :end_date, :priority, :story_point, :start_date, :status, :task_type, presence: :true
  #file upload
  has_many_attached :attached_files
end
