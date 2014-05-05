class RealestatesController < ApplicationController
  include RealestatesHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :show, :update, :destroy]
  before_filter :check_realestates_owner, only: [:edit, :update, :destroy]

  def index
    @realestates= Realestate.all
    key = ENV['TWITTER_KEY']
  end

  def new
    @realestate = Realestate.new
  end

  def create
    realestate = Realestate.create(realestate_params)
    if realestate.save
      redirect_to realestate
    else
      flash[:error] = "The financial instrument could not be saved.  Try again"
      redirect_to root_path
   end

  end
  # def 
  #   require 'nokogiri'

# # read and parse the old file
# file = File.read("old.xml")
# xml = Nokogiri::XML(file)

# # replace \n and any additional whitespace with a space
# xml.xpath("//SUPPLIER").each do |node|
#   node.content = node.content.gsub(/\n\s+/, " ")
# end

# save the output into a new file
# File.open("new.xml", "w") do |f|
#   f.write xml.to_xml
# end
#   end

  def show
    @realestate = Realestate.find(params[:id])
   # @real_estates = @financial_instrument.real_estates
  end

  def edit
    @realestate = Realestate.find(params[:id])
  end

  def update
    realestate = Realestate.find(params[:id])
    realestate.update_attributes realestate_params
    redirect_to(realestate)
  end

  def destroy
    realestate = Realestate.find(params[:id])
    realestate.delete
    redirect_to(realestate_path)
  end

  private
    def realestate_params
      params.require(:realestate).permit(:zipaddress, :zipcity, :zipcode, :zipid, :zestimate, :zillow_link)
    end
end

