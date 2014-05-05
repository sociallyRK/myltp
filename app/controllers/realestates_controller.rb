class RealestatesController < ApplicationController
  include RealestatesHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :show, :update, :destroy, :index]
  before_filter :load_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @realestates = current_user.realestates
  end

  def new
    @realestate = Realestate.new
  end

  def create
    realestate = current_user.realestates.create(realestate_params)
    if realestate.save
      redirect_to realestate
    else
      flash[:error] = "The real estate property could not be saved.  Try again"
      redirect_to root_path
   end
  end
  # def 

    # file = File.read("http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1b7dw87o7wr_3mmvk&address=400%20Beale%20Ave&citystatezip=San%20Francisco,%20CA%2094105")
    # xml = Nokogiri::XML(file)
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

