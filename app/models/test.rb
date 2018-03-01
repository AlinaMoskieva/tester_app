class Test < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def first_task
    tasks.find_by_index(0)
  end
end
