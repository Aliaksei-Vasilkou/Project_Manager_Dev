class Task < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 5, maximum: 50}
end
