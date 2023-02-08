class Author < ApplicationRecord
    has_many :articles,dependent: :destroy
    has_secure_password
    validates :email, uniqueness: true
    validates :name, uniqueness: true
    has_many :like,dependent: :destroy 
    has_many :comment,dependent: :destroy
end
