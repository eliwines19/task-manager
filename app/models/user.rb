class User < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :tasks 
    has_many :project_tasks, through: :tasks, source: :project

    validates :name, presence: true 
    validates :email, presence: true
    validates :password, presence: true 
end
