class PetApplicationsController < ApplicationController
  def index
    @pet_apps = PetApplication.where(pet_id: params[:id])
  end

  def create
    match = PetApplication.new(pet_id: params[:pet][:pet_id], user_application_id: params[:id])
    match.save!
    
    redirect_to "/applications/#{params[:id]}"
  end
end