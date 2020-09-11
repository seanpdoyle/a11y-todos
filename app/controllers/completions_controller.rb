class CompletionsController < ApplicationController
  def create
    tasks = Task.where(id: event_params.fetch(:task_ids))

    Task.transaction { tasks.each(&:complete!) }

    redirect_back fallback_location: root_url
  end

  private

  def event_params
    params.require(:event).permit(task_ids: [])
  end
end
