class ProjectsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @project = @user.projects.build
      else
        @project = Project.new
      end
    end
  
    def index
      @projects = Project.alpha
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
      @project = Project.find_by_id(params[:id])
      redirect_to projects_path if !@project || @project.user != current_user
    end
  
    def update
      @project = Project.find_by(id: params[:id])
      redirect_to projects_path if !@project || @project.user != current_user
      if @project.update(project_params)
        redirect_to project_path(@project)
      else
        render :edit
      end
    end
  
    def show
      @project = Project.find_by_id(params[:id])
      redirect_to projects_path if !@project
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
    
      redirect_to projects_path
    end

    def most_tasks
      @project = Project.most_tasks
    end
  
    private
  
    def project_params
      params.require(:project).permit(:title, :description, :due_date)
    end

end
