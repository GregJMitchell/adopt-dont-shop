class ShelterReviewsController < ApplicationController
    def new
        @shelter = Shelter.find(params[:id])
        @users = User.all
    end

    def create
        review = Review.new(
            title: params[:review][:title],
            rating: params[:review][:rating],
            content: params[:review][:content],
            username: params[:review][:username],
            image: params[:review][:image],
            shelter_id: params[:review][:shelter_id],
            user_id: params[:review][:username]
        )
        
    review.save
    redirect_to "/shelters/#{review.shelter.id}"
    end

    def edit
        
    end
end