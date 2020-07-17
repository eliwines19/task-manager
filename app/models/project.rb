class Project < ApplicationRecord
    belongs_to :user 
    has_many :tasks 
    has_many :users, through: :tasks

    validates :title, presence: true 
    validates :description, presence: true 
    validates :due_date, presence: true 
end
