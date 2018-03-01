class ResultsController < ApplicationController
  expose :tasks, -> { test.tasks }
  expose :tests, -> { Test.all }
  expose :test

  def index
  end

  def show
    Results::CheckAnswers.call(test: test).check_answers
  end
end
