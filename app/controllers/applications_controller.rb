class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end
  def show
    @applications = Application.all
    @application = Application.find(params[:id])
  end
  def new
  end
  def create
    application = Application.create(name: params[:name], street: params[:street], city: params[:city], state: params[:state], zip: params[:zip], description: params[:description], status: "In Progress")
    redirect_to "/applications/new/#{application.id}"
  end
  def new_show
    @application = Application.find(params[:id])
    @pet = @application.search_pet(params[:search])
    @application.add_pet(params[:add], params[:pet_adopt])
    @can_submit = @application.is_pets?
  end
  def renew
    @application = Application.find(params[:id])
    @application.update(status: "Pending")
    redirect_to "/applications/new/#{@application.id}"
  end
end
