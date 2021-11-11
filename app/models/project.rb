class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user 
  validates :title, :description, :status,:due_date ,presence: :true
  validates_length_of :title, minimum: 5, maximum: 255
  validates_length_of :description, minimum: 5, maximum: 1000
end
