module ProjectsHelper

    def index_display_header
      if @user
        content_tag(:h1, "#{@user.name}'s Projects:")
      else
        content_tag(:h2, "All Projects")
      end
    end
  
    def display_projects
      if @user.projects.empty?
        tag.h2("No Projects Yet")
      else
        user = @user == current_user ? 'Your' : "#{@user.name}'s"
        content_tag(:h2, "#{user} #{pluralize(@user.projects.count, 'Project')}:")
      end
    end

end
