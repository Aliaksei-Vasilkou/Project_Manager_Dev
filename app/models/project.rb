class Project < ApplicationRecord
  belongs_to :user
  has_many   :tasks, dependent: :destroy

  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :summary, presence: true, length: {minimum: 5, maximum: 50}

end
