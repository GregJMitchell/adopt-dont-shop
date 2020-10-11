class ShelterPetsController < ApplicationController
  def pets
    @pets = []
    pets = Pet.all
    pets.find_each do |pet|
      if pet.shelter_id == params[:id].to_i
        @pets << pet
      end
    end
    @shelter = Shelter.find(params[:id])
  end
  
  def new_pet
    @shelter = Shelter.find(params[:id])
  end

  def create_pet
    
    pet = Pet.new({
      image: params[:pet][:image],
      name: params[:pet][:name],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      description: params[:pet][:description],
      shelter_id: params[:id],
      status: "Adoptable"
    })
    pet.save
    redirect_to "/shelters/#{params[:id]}/pets"
  end
end