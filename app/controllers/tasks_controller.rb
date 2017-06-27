class TasksController < ApplicationController
  before_action :find_project

  def create
    @task = @project.tasks.create(task_params)
    @task.owner = current_user.id
    @task.status_id = 1   # Setting default status into "New"
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_path(@project), notice: 'New task was successfully created' }
        format.js
      else
        format.html { render 'projects/show' }
        format.js
      end
    end
  end

  def edit
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: 'Task was successfully updated' }
        format.js
    else
      render 'edit'
    end
  end

  def destroy
      @task = @project.tasks.find(params[:id])
      @task.destroy
      respond_to do |format|
        format.html { redirect_to project_path(@project), notice: 'Task was successfully destroyed' }
        format.js
      end
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
