class TestsController < ApplicationController
  def create
    result = Tests::Create.call(user: current_user).test
    redirect_to result.first_task, location: task_path(result.first_task)
  end
end
