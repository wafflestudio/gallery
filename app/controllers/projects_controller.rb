class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @sketches = Sketch.all

  end

  def new
    @project = Project.new
    
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
