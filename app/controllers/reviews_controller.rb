class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create

    # review_params will be get from the FORM
    @review = Review.new(review_params)

    # we have to precise to which restaurant the review is attached.
    @restaurant = Restaurant.find(params[:restaurant_id])
    # then we assign it to the active record
    @review.restaurant = @restaurant
    if @review.save
    # or @review.restaurant = Restaurant.find(params[:id])
    # the same should be done after the assignment to a restaurant!
      redirect_to restaurant_path(@review.id)
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
