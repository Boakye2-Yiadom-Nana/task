class Category < ApplicationRecord
    has_many :todo_tasks
    validates :name, presence: true, uniqueness: true
end
