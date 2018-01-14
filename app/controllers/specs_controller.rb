class SpecsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @specs = Spec.order("created_at DESC")
  end

  def show
    @spec = Spec.find(params[:id])
  end

  def new
    @spec = Spec.new
  end

  def create
    @spec = Spec.new(spec_params)
    @spec.user = current_user
    
    if @spec.save
      redirect_to root_path, notice: "The spec has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @spec = Spec.find(params[:id])
    authorize_action_for @spec
  end

  def update
    @spec = Spec.find(params[:id])
    authorize_action_for @spec
    if @spec.update_attributes(spec_params)
      redirect_to root_path, notice: "The spec has been successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @spec = Spec.find(params[:id])
    authorize_action_for @spec
    @spec.destroy

    redirect_to root_path
  end

private

  def spec_params
    params.require(:spec).permit(:title, :body)
  end
end
