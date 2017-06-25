class TasksController < ApplicationController
  before_action :find_project

  def create
    @task = @project.tasks.create(task_params)
    @task.owner = current_user.id
    @task.status_id = 1   # Setting default status into "New"
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project), notice: 'New task was successfully created' }
      else
        format.html { render 'projects/show' }
      end
    end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to @project, notice: 'Task was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    def destroy
      @task = @project.tasks.find(params[:id])
      @task.destroy
      redirect_to project_path(@project)
    end
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status_id, :user_id, :owner)
  end
end
