class ReopeningsController < ApplicationController
  def create
    task = Task.find(params[:task_id])

    task.reopen!

    redirect_back fallback_location: root_url
  end
end
