class ShelterPetsController < ApplicationController
  def pets
    @pets = Pet.all
    @pets.find_each do |pet|
      pet.id == params[:id]
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
      shelter: params[:pet][:shelter_id],
      status: "Adoptable"
    })
    pet.save
    redirect_to "/shelters/#{params[:id]}/pets"
  end
end