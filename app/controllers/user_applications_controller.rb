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
        address: user.address,
        city: user.city,
        state: user.state,
        zip: user.zip,
        status: "In Progress",
        user_id: user.id
      )
      if application.save!
        redirect_to "/applications/#{application.id}"
      end
    end
  end

  def show
    @pets = Pet.all
    @application = UserApplication.find(params[:id])
    if params[:search]
      @found_pets = UserApplication.find_pets(params[:search][:name])
    else
      @found_pets = []
    end
  end

  def update
    application = UserApplication.find(params[:id])
    if params[:application][:description] == ""
      flash[:notice] = "Application not created: description not found."
      redirect_to "/applications/#{application.id}"
    else
    application.update(
        description: params[:application][:description],
        status: "Pending",
      )
    application.save!
     redirect_to "/applications/#{application.id}"
    end
  end
end
