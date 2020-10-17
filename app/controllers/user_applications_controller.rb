class UserApplicationsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:application][:name])
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
    application.save!
    redirect_to "/applications/#{application.id}"
  end

  def show
    @application = UserApplication.find(params[:id])
  end
end