class TaskDecorator < ApplicationDecorator
  delegate :question, :answer, :user_answer
  delegate :index, :test, to: :task
  delegate :tasks, to: :test

  def progress
    "#{index + 1}/ #{tasks.count}"
  end
end
