class Admin::SketchesController < Admin::AdminController
  def index
		@sketches = Sketch.all
  end

	def show
		@sketch = Sketch.find(params[:id])
	end

	def new
		@sketch = Sketch.new
	end

	def edit
		@sketch = Sketch.find(params[:id])
	end

	def create
		@sketch = Sketch.new(params[:sketch])
		if @sketch.save
			redirect_to admin_sketches_path
		else
			render new_admin_sketch_path
		end
	end

	def update
		@sketch = Sketch.find(params[:id])
		if @sketch.update_attributes(params[:sketch])
			redirect_to admin_sketch_path(@sketch)
		else
			render edit_admin_sketch_path
		end
	end

	def destroy
		@sketch = Sketch.find(params[:id])
		@sketch.destroy
		redirect_to admin_sketches_path
	end
end
