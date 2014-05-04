class FinancialInstrumentsController < ApplicationController
  include FinancialInstrumentsHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
  before_filter :check_financial_instrument_owner, only: [:edit, :update, :destroy]

  def index
    @financialinstruments= FinancialInstrument.all
  end

  def new
    @financialinstrument = FinancialInstrument.new
  end

  def create
    financialinstrument = FinancialInstrument.create financial_instrument_params
    redirect_to(financial_instrument)
  end

  def show
    @financialinstrument = FinancialInstrument.find(params[:id])
    @real_estates = @financialinstrument.real_estates
  end

  def edit
    @financialinstrument = FinancialInstrument.find(params[:id])
  end

  def update
    financialinstrument = FinancialInstrument.find(params[:id])
    financialinstrument.update_attributes financialinstrument_params
    redirectto(financialinstrument)
  end

  def destroy
    financialinstrument = FinancialInstrument.find(params[:id])
    financialinstrument.delete
    redirect_to(financialinstruments_path)
  end

  private
    def financialinstrument_params
      params.require(:financialinstrument).permit(:instrument_type, :instrument_sub, :amount)
    end
end


