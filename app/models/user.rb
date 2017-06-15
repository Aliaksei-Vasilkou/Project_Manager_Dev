class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_validation :set_default_role

  private
  def set_default_role
    self.role ||= Role.find_by_name('user')
  end

end