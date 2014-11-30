class ProjectsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to root_path
		else
			redirect_to new_project_path
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description)
	end

end
