class ProjectsController < ApplicationController
  layout "admin"
  before_filter :find_or_build_project, :except => :index
  def index
    @projects = Project.all
  end

  def new
  end

  def edit
  end

  def create
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice => 'Project successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

private
  def find_or_build_project
    @project = params[:id] ? Project.find(params[:id]) : Project.new(params[:project])
    @story = @project
  end
end
