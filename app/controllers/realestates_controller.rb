class RealestatesController < ApplicationController
  #require 'open-uri'
  include RealestatesHelper


  before_filter :signed_in_user, only: [:create, :new, :edit, :show, :update, :destroy, :index]
  before_filter :load_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @realestates = current_user.realestates
    @realsum = Realestate.sum_of_realestate(current_user)
  end

  def new
    @realestate = Realestate.new
  end

  def create
    realestate = current_user.realestates.create(realestate_params)
    #zillow_link = "http://www.zillow.com/webservice/GetSearchResults.htm?#{ENV['ZILLOW_KEY']}&address=#{realestate.zipaddress}&citystatezip=#{realestate.zipcity}, #{realestate.zipstate} #{realestate.zipcode}"
    #doc = Nokogiri::HTML(open(zillow_link))
    #realestate.zestimate = doc.css("zestimate amount")[0].children.text.to_i
    if realestate.save
      redirect_to realestate
    else
      flash[:error] = "The real estate property could not be saved.  Try again"
      redirect_to root_path
   end


  end

  def show
   # @real_estates = @financial_instrument.real_estates
  end

  def edit
  end

  def update
    @realestate.update_attributes realestate_params
    redirect_to(@realestate)
  end

  def destroy
    @realestate.delete
    redirect_to(realestates_path)
  end

  private
    def realestate_params
      params.require(:realestate).permit(:zipaddress, :zipcity, :zipstate, :zipcode, :zipid, :zestimate, :zillow_link)
    end
    def load_instrument
      @realestate = Realestate.find(params[:id])
      redirect_to root_path unless @realestate.user == current_user
    end
end

