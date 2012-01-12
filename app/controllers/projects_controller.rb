class ProjectsController < ApplicationController
  before_filter :find_or_build_story, :except => :index
  def index
    @projects = Project.all
    @sketches = Sketch.all
  end

  def new
  end

  def edit
  end

  def create
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

private
  def find_or_build_story
    @project = params[:id] ? Project.find(params[:id]) : Project.new(params[:project])
    @story = @project
  end
end
