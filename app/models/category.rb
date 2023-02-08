class Category < ApplicationRecord
    has_many :connecttable, dependent: :destroy
    has_many :article, through: :connecttable

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end

