class PetApplicationsController < ApplicationController
  def create
    match = PetApplication.new(pet_id: params[:pet][:pet_id], user_application_id: params[:id])
    match.save!
    
    redirect_to "/applications/#{params[:id]}"
  end
end