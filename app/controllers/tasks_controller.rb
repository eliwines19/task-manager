class TasksController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_task_creator, only: [:edit, :update]

    def index
      if params[:project_id] && @project = Project.find_by_id(params[:project_id])
        @tasks = @project.tasks.recently_created
      else
        @error = "That project doesn't exist" if params[:project_id]
        @tasks = Task.recently_created
      end
    end
 
    def new
      if params[:project_id] && @project = Project.find_by_id(params[:project_id])
        @task = @project.tasks.build
      else
        @error = "That project doesn't exist" if params[:project_id]
        @task = Task.new
      end
    end
 
    def create
      @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to projects_path
      else
        render :new
      end
    end
 
    def show
    end

    def edit
    end
 
    def update
      if @task.update(task_params)
        redirect_to project_path
      else
        render :edit
      end
    end

    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    def upcoming_dates
      @tasks = Task.upcoming_dates
    end
 
    private

    def task_params
      params.require(:task).permit(:name, :description, :due_by, :project_id)
    end

    def set_task
      @task = Task.find_by(id: params[:id])
      if !@task
        flash[:message] = "Task was not found"
        redirect_to tasks_path
      end
    end

    def redirect_if_not_task_creator
      redirect_to tasks_path if @task.user != current_user
    end
end
