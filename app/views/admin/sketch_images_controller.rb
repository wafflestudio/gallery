class Admin::SketchImagesController < Admin::AdminController
  def index
		@sketch_images = SketchImage.all
  end

	def show
		@sketch_image = SketchImage.find(params[:id])
	end

	def new
		@sketch_image = SketchImage.new
	end

	def edit
		@sketch_image = SketchImage.find(params[:id])
	end

	def create
		@sketch_image = SketchImage.new(params[:sketch_image])
		if @sketch_image.save
			redirect_to admin_sketch_images_path
		else
			render new_admin_sketch_image_path
		end
	end

	def update
		@sketch_image = SketchImage.find(params[:id])
		if @sketch_image.update_attributes(params[:sketch_image])
			redirect_to admin_sketch_image_path(@sketch_image)
		else
			render edit_admin_sketch_image_path
		end
	end

	def destroy
		@sketch_image = SketchImage.find(params[:id])
		@sketch_image.destroy
		redirect_to admin_sketch_images_path
	end
end
