class Project < ApplicationRecord
  belongs_to :user
  has_many   :tasks, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5, maximum: 25}
  validates :summary, presence: true, length: {minimum: 5, maximum: 70}

end
