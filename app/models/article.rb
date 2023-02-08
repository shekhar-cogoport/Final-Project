class Article < ApplicationRecord
    has_many :connecttable, dependent: :destroy
    has_many :category, through: :connecttable
    has_many :like 
    has_many :comment,dependent: :destroy
    belongs_to :author,dependent: :destroy
end


