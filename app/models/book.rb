class Book < ApplicationRecord
    has_and_belongs_to_many :users
    validates :title, :author, :price, :date, presence: true
end
