class DesignsController < ApplicationController
  before_action :authenticate, except: [:index, :show]

	def index
    	@designs = Design.order("created_at DESC")
  	end

	def show
    	@design = Design.find(params[:id])
  	end

    def new
    	@design = Design.new
  	end

    def create
    	@design = Design.new(design_params)
    	if @design.save
      		redirect_to root_path, notice: "The design has been successfully created."
    	else
      		render action: "new"
    	end
  	end

    def edit
    	@design = Design.find(params[:id])
    end

    def update
    	@design = Design.find(params[:id])
    	if @design.update_attributes(design_params)
    		redirect_to root_path, notice: "The design has been successfully updated."
    	else
      		render action: "edit"
    	end
    end

    def destroy
      @design = Design.find(params[:id])
      @design.destroy

      redirect_to root_path
  end

	private

  		def design_params
    		params.require(:design).permit(:title, :body)
  		end
end
