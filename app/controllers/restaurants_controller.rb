class RestaurantsController < ActionController::Base
  before_action :set_restaurant, only: %i[show]

    def index
      @restaurant = Restaurant.all
    end

    def show
    end

    def edit
    end

    def new
      @restaurant = Restaurant.new
    end

  def create
    restaurant = Restaurant.new(restaurant_params)

     if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was succesfully created.'
    else
      render :new
    end
  end
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number, :rating)

  end
end
