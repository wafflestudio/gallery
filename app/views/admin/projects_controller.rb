class Admin::ProjectsController < Admin::AdminController
  def index
		@projects = Project.all
  end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			redirect_to admin_projects_path
		else
			render new_admin_project_path
		end
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(params[:project])
			redirect_to admin_project_path(@project)
		else
			render edit_admin_project_path
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to admin_projects_path
	end
end
