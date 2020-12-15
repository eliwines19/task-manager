class User < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :tasks

    validates :name, presence: true 
    validates :email, presence: true
    validates :password, presence: true 
end
