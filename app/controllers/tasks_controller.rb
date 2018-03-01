class TasksController < ApplicationController
  expose_decorated :task

  def update
    task.update(tasks_params)

    if task.next_exist?
      redirect_to task.next_task, location: task_path(task.next_task)
    else
      redirect_to result_path(task.test)
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:user_answer)
  end
end
