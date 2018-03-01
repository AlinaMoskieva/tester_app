class ResultsController < ApplicationController
  expose :tasks, -> { test.tasks }
  expose :tests, -> { Test.all }
  expose :results, -> { Result.new }
  expose :test

  def show
    Results::CheckAnswers.call(test: test).check_answers
  end
end
