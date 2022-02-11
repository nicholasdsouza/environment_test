class Student < ApplicationRecord
    has_one :books
    has_one :users
end
