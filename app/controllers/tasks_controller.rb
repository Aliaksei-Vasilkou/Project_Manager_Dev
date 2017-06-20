class TasksController < ApplicationController
  before_action :find_project

  def create
    @task = @project.tasks.create(task_params)
    @task.save

    if @task.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end

end
