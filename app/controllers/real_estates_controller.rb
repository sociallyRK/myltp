class RealEstatesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]

  def index
    @real_esates = Real_estate.all
  end

  def new
    @real_estate= Real_estate.new
  end

  def create
    real_estate= Real_estate.create(real_estate_params)
    redirect_to real_estate
  end

  def show
    @real_estate = Real_estate.find(params[:id])
  end

  def edit
    @real_estate = Real_estate.find(params[:id])
  end

  def update
    real_estate = Real_estate.find(params[:id])
    real_estate.update_attributes(real_estate_params)
    redirect_to(real_estate)
  end

  def destroy
    real_estate = Real_estate.find(params[:id])
    real_estate.delete
    redirect_to real_estates_path
  end

  private
    def real_estate_params
      params.require(:real_estate).permit(:zipaddress, :zipcity, :zipcode, :zipid, :zestimate, :zillow_link)
    end

end

