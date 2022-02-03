class Book < ApplicationRecord
    validates :title, :author, :price, :date, presence: true
end
