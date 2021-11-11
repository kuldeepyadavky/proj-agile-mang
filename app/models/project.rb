class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user 
  validates :title, :description, :status,:due_date ,presence: :true
end
