class PromotionsController < ApplicationController
  def create
    task = Task.find(params[:task_id])

    task.promote!

    redirect_back fallback_location: root_url
  end
end
