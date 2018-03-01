class Task < ApplicationRecord
  enum content_type: { verbal: "verbal", icon: "icon", style: "style" }
  validates :question, :answer, :content_type, presence: true

  FONT_FAMILY = ["Pompadur", "Verdana", "Graublau Sans Web"].freeze
  COLORS = ["green", "blue", "red"].freeze

  belongs_to :test

  def next_task
    test.tasks.find_by_index(index + 1)
  end

  def next_exist?
    index + 1 != test.tasks.count
  end
end
