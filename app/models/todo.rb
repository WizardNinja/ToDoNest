class Todo < ActiveRecord::Base
  attr_accessible :description, :completed, :todo_id,  :user_id

  belongs_to :user
  has_many :todos

  validates :description, presence: true
  validates :user, presence: true
end
