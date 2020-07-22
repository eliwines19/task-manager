class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            #redirect to the show page
            redirect_to @user
        else
            render :new
        end
    end

    def show 
        redirect_if_not_logged_in
        redirect_to '/' if !@user
    end

    def projects
        @projects = current_user.projects 
    end

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
    
end
