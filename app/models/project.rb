class Project < ApplicationRecord

    belongs_to :user 
    has_many :tasks, dependent: :destroy 
    has_many :users, through: :tasks

    validates :title, presence: true 
    validates :description, presence: true 
    validates :due_date, presence: true 

    scope :alpha, -> { order(:title) }
    scope :most_tasks, -> { left_joins(:tasks).group('projects.id').order('count(tasks.project_id) desc limit 1') }

end
