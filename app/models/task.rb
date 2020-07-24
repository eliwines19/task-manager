class Task < ApplicationRecord
    
    belongs_to :user 
    belongs_to :project

    validates :name, presence: true 
    validates :description, presence: true
    validates :due_by, presence: true 

    scope :upcoming_dates, -> { group('tasks.due_by') }

end
