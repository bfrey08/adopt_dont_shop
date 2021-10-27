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
      binding.pry
      @pet = Pet.find_by('name LIKE ?', "%#{pet_search}%")
    elsif params[:add] == 'yes'
      pet_adopt = params[:pet_adopt]
      pet_adopt[0] = pet_adopt[0].upcase
      @pet = Pet.find_by(name: pet_adopt)
      @application.pets << @pet
    else
    end
    if @application.pets.count >= 1
      @can_submit = true
    else
      @can_submit = false
    end
  end
  def renew
    @application = Application.find(params[:id])
    @application.update(status: "Pending")
    redirect_to "/applications/new/#{@application.id}"
  end
end
