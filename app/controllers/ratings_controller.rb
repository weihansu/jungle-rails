class RatingsController < ApplicationController

  def create

    @rating = Rating.new(
      product_id: params[:product_id],
      user: current_user,
      rating: params[:product]['rating'],
      description: params[:product]['description']
    )

    @rating.save
    redirect_to :back
  end
end
