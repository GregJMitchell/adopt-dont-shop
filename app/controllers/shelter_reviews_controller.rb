class ShelterReviewsController < ApplicationController
    def new
        @shelter = Shelter.find(params[:id])
        @users = User.all
    end

    def create
        user = User.find_by(name: params[:review][:username])

        review = Review.new(
            title: params[:review][:title],
            rating: params[:review][:rating],
            content: params[:review][:content],
            username: params[:review][:username],
            image: params[:review][:image],
            shelter_id: params[:review][:shelter_id],
            user_id: user.id
        )
        
    review.save
    redirect_to "/shelters/#{review.shelter.id}"
    end

    def edit
        @review = Review.find(params[:id])
    end
end