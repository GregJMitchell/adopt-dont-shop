class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new

  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      image: params[:pet][:image],
      name: params[:pet][:name],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      description: params[:pet][:description],
      shelter_id: pet.shelter_id,
      status: "Adoptable"
    })
    pet.save
    redirect_to "/pets/#{params[:id]}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end
