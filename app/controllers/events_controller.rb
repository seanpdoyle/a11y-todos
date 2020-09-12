class EventsController < ApplicationController
  def new
    tasks = Task.all
    selected_task = tasks.find_by(id: params[:task_id])

    render layout: false, locals: {tasks: tasks, selected_task: selected_task}
  end
end
