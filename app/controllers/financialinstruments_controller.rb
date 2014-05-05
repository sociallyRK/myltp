class FinancialinstrumentsController < ApplicationController
  include FinancialinstrumentsHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :show, :update, :destroy]
  before_filter :check_financialinstruments_owner, only: [:edit, :update, :destroy]

  def index
    @financialinstruments= Financialinstrument.all
  end

  def new
    @financialinstrument = Financialinstrument.new
  end

  def create
    puts "I am in create"
    financialinstrument = Financialinstrument.create(financialinstrument_params)
    if financialinstrument.save
      redirect_to financialinstrument
    else
      flash[:error] = "The financial insturment could not be saved.  Try again"
      redirect_to root_path
    puts "I am leaving create"
   end
    #financialinstrument = Financialinstrument.create financialinstrument_params
    #redirect_to(financialinstrument)
  end

  def show
    @financialinstrument = Financialinstrument.find(params[:id])
   # @real_estates = @financial_instrument.real_estates
  end

  def edit
    @financialinstrument = Financialinstrument.find(params[:id])
  end

  def update
    financialinstrument = Financialinstrument.find(params[:id])
    financialinstrument.update_attributes financialinstrument_params
    redirect_to(financialinstrument)
  end

  def destroy
    financialinstrument = Financialinstrument.find(params[:id])
    financialinstrument.delete
    redirect_to(financialinstruments_path)
  end

  private
    def financialinstrument_params
      params.require(:financialinstrument).permit(:instrument_type, :instrument_sub, :amount)
    end
end



