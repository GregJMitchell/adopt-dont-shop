class UserApplicationsController < ApplicationController
  def new
    
  end

  def show
    @application = UserApplication.find(params[:id])
  end
end