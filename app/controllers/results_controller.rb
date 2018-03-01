class ResultsController < ApplicationController
  expose :tasks, -> { test.tasks }
  expose :tests, -> { Test.all }

  def index
  end

  def show
    Results::CheckAnswers.call(test: test).check_answers
  end
end
