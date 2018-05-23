class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    # this is from the url
    # if there is a GET in the route, params will come from the url
    @restaurant = Restaurant.find(params[:id])

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # we need the idea, see the route!!
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

private

# methods can be listed after they are called!!

def restaurant_params
  # this comes from the post
   params.require(:restaurant).permit(:name, :address, :category)
end

end
