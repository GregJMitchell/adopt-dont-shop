class AdminController < ApplicationController
  def show
    @application = UserApplication.find(params[:id])
  end

  def status
    @application = UserApplication.find(params[:id])
    pet_application = PetApplication.find_by(pet_id: params[:pet], user_application_id: params[:id])

    pet_application.update(status: params[:status])

    if UserApplication.approved?(params[:id]) == 'pending'
      return redirect_to "/admin/applications/#{params[:id]}"
    elsif !UserApplication.approved?(params[:id])
      @application.update(status: 'Rejected')
    elsif UserApplication.approved?(params[:id])
      @application.update(status: 'Approved')
    end

    redirect_to "/admin/applications/#{params[:id]}"
  end
end
