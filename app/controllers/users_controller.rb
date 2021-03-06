class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def create
    user = User.new({
      name: params[:user][:name],
      address: params[:user][:address],
      city: params[:user][:city],
      state: params[:user][:state],
      zip: params[:user][:zip]
    })
    user.save!
    redirect_to "/users/#{user.id}"
  end
end
