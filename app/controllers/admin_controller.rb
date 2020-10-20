class AdminController < ApplicationController
  def show
    @application = UserApplication.find(params[:id])

  end

  def status
    
    application = PetApplication.find_by(pet_id: params[:pet], user_application_id: params[:id])

    application.update(status: params[:status])
    
    redirect_to "/admin/applications/#{params[:id]}"
  end
end