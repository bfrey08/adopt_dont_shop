class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end
  def show
    @applications = Application.all
    @application = Application.find(params[:id])
  end
end
