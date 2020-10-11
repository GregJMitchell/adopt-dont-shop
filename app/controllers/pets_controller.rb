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
    require 'pry'; binding.pry
    pet.update({
      image: params[:pet][:image],
      name: params[:pet][:name],
      age: params[:pet][:age],
      sex: params[:pet][:sex],
      shelter_id: pet.shelter,
      status: "Adoptable"
    })
    pet.save
    redirect_to ""
  end
end
