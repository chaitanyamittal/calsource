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
		@project.user = current_user

		if @project.save
			flash[:success] = "Successfully created project!"
			redirect_to @project
		else
			flash[:error] = @project.errors.full_messages.to_sentence
			redirect_to new_project_path
		end
	end

	def show
		@project = Project.find(params[:id])

	end

	def delete
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	def project_params
		params.require(:project).permit(:name, :description)
	end



end
