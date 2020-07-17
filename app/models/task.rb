class Task < ApplicationRecord
    belongs_to :user 
    belongs_to :project

    validates :name, presence: true 
    validates :description, presence: true
    validates :due_by, presence: true 
end
