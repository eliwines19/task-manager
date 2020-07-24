class Task < ApplicationRecord
    
    belongs_to :user 
    belongs_to :project

    validates :name, presence: true 
    validates :description, presence: true
    validates :due_by, presence: true 

    scope :recently_created, -> { order('tasks.created_at desc') }
    scope :upcoming_dates, -> { order('tasks.due_by') }

end
