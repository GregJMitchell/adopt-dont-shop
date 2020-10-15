class ShelterReviewsController < ApplicationController
    def new
        @shelter = Shelter.find(params[:id])
        @users = User.all
    end

    def create
        @shelter = Shelter.find(params[:id])
        user = User.find_by(name: params[:review][:username])
        if user == nil
            flash[:notice] = "Review not created: Required information missing."
            render :new
        else
            review = Review.new(
                title: params[:review][:title],
                rating: params[:review][:rating],
                content: params[:review][:content],
                username: params[:review][:username],
                image: params[:review][:image],
                shelter_id: params[:id],
                user_id: user.id
            )
            if review.save
                redirect_to "/shelters/#{review.shelter.id}"
            else
                flash[:notice] = "Review not created: Required information missing."
                render :new
            end
        end
    end

    def edit
        @review = Review.find(params[:id])
        @shelter = @review.shelter
    end

    def update
        review = Review.find(params[:id])
        user = User.find_by(name: params[:review][:username])
        review.update(
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
end