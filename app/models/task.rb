class Task < ApplicationRecord
    
    belongs_to :user 
    belongs_to :project

    validates :name, presence: true 
    validates :description, presence: true
    validates :due_by, presence: true 

    scope :by_project, -> { order('tasks.project_id') }
    scope :upcoming_dates, -> { order('tasks.due_by') }

end
