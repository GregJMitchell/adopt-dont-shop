class PetsController < ApplicationController
  def index; end

  def create
    pet = Pet.new({
                            image: params[:pet][:image],
                            name: params[:pet][:name],
                            age: params[:pet][:age],
                            sex: params[:pet][:sex],
                            shelter: params[:pet][:shelter]
                          })
    pet.save
    redirect_to '/pets'
  end
end
