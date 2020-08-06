class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_project, only: [:edit, :update, :show, :destroy]
    before_action :redirect_if_not_project_creator, only: [:edit, :update]

    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @project = @user.projects.build
      else
        @project = Project.new
      end
    end
  
    def index
      @projects = Project.most_recent
    end
  
  
    def create
      @project = current_user.projects.build(project_params)
      if @project.save
        redirect_to projects_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      redirect_to projects_path if !@project || @project.user != current_user
      if @project.update(project_params)
        redirect_to project_path(@project)
      else
        render :edit
      end
    end
  
    def show
    end

    def destroy
      @project.destroy
      redirect_to projects_path
    end

    def most_tasks
      @projects = Project.most_tasks
    end

    def upcoming_dates
      @projects = Project.upcoming_dates
    end
  
    private
  
    def project_params
      params.require(:project).permit(:title, :description, :due_date, :completed)
    end

    def set_project
      @project = Project.find_by_id(params[:id])
      if !@project
        flash[:message] = "Project was not found"
        redirect_to projects_path
      end
    end 

    def redirect_if_not_project_creator
      redirect_to projects_path if @project.user != current_user
    end 

end
