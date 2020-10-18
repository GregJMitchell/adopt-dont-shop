class UserApplicationsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:application][:name])
    if user.nil?
      flash[:notice] = "Application not created: Username not found."
      render :new
    else
      application = UserApplication.new(
        name: params[:application][:name],
        address: params[:application][:address],
        city: params[:application][:city],
        state: params[:application][:state],
        zip: params[:application][:zip],
        description: params[:application][:description],
        status: "In Progress",
        user_id: user.id
      )
      if application.save!
        redirect_to "/applications/#{application.id}"
      else
        flash[:notice] = "Application not created: Required information missing."
        render :new
      end
    end
  end

  def show
    @application = UserApplication.find(params[:id])
    if params[:search]
      @found_pets = UserApplication.find_pets(params[:search][:name])
    else
      @found_pets = []
    end
  end
end