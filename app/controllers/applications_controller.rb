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
    if params[:search] != nil

      pet_search = params[:search].downcase
      pet_search[0] = pet_search[0].upcase!
      @pet = Pet.find_by(name: pet_search)
    end
  end
end
