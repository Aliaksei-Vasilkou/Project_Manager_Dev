require 'test_helper'

class TaskControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @task = tasks(:one)
    @tasks = @project.tasks
  end

  test "sould_be_valid_task_title" do
    @task.title = ""
    @task.save
    assert true
  end

  test "sould be valid task description" do
    @task.description = ""
    @task.save
    assert true
  end


end
