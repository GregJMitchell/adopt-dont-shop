class PetApplicationsController < ApplicationController
  def create
    @pets = Pet.where(name: params[:search][:name]).all
    @pets.each do |pet|
      match = PetApplication.new(pet_id: pet.id, user_application_id: params[:id])
      match.save!

    end
    
    redirect_to "/applications/#{params[:id]}"
  end
end