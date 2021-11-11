class SubTask < ApplicationRecord
  belongs_to :task
  validates :title, :status, presence: :true
end
