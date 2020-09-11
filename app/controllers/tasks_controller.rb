class TasksController < ApplicationController
  def index
    tasks = Task.all

    render locals: {tasks: tasks}
  end
end
