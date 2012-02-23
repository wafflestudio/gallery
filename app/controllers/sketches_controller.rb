class SketchesController < ApplicationController
  before_filter :find_or_build_sketch, :except => :index

	def show
		@sketch = Sketch.find(params[:id])
		render :layout => false
	end

private
  def find_or_build_sketch
    @sketch = params[:id] ? Sketch.find(params[:id]) : Sketch.new(params[:sketch])
  end
end
