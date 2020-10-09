class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    
  end

  def create
    pet = Pet.new({
                            image: params[:pet][:image],
                            name: params[:pet][:name],
                            age: params[:pet][:age],
                            sex: params[:pet][:sex],
                            shelter: params[:pet][:shelter_id]
                          })
    pet.save
    redirect_to '/pets'
  end
end
