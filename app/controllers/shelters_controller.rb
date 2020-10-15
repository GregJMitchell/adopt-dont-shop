class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new

  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
    })
    shelter.save!
    redirect_to '/shelters'
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]})
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def new_review
    @shelter = Shelter.find(params[:id])
  end

  def create_review
    user = User.find_by(name: params[:review][:username])

    review = Review.new(
      title: params[:review][:title],
      rating: params[:review][:rating],
      content: params[:review][:content],
      username: params[:review][:username],
      image: params[:review][:image],
      shelter_id: params[:id],
      user_id: user_id
    )

    review.save
    redirect_to "/shelters/#{params[:id]}"
  end

  def edit_review
    require 'pry'; binding.pry
  end
end
