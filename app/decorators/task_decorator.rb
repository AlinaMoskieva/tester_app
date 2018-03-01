class TaskDecorator < ApplicationDecorator
  delegate :question, :answer, :user_answer
  delegate :index, :test, :question, to: :task
  delegate :tasks, to: :test

  def progress
    "#{index + 1}/ #{tasks.count}"
  end

  def question_text
    question.html_safe
  end
end
