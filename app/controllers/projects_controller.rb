class ProjectsController < ApplicationController
  before_filter :find_or_build_project

	def show
		@project = Project.find(params[:id])
		render :layout => false
	end
  def index
    render :layout => false
  end

private
  def find_or_build_project
    @project = params[:id] ? Project.find(params[:id]) : Project.new(params[:project])
    @story = @project
  end
end
