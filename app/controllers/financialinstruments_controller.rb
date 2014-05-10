class FinancialinstrumentsController < ApplicationController
  include FinancialinstrumentsHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :show, :update, :destroy, :index]
  before_filter :load_instrument, only: [:show, :edit, :update, :destroy]

  def index
    @financialinstruments = current_user.financialinstruments
    @finsum = Financialinstrument.sum_of_financialinstrument(current_user)
    @finincome = Financialinstrument.financial_income(current_user)
  end

  def new
    @financialinstrument = Financialinstrument.new
  end

  def create
    financialinstrument = current_user.financialinstruments.create(financialinstrument_params)
    if financialinstrument.save
      redirect_to financialinstrument
    else
      flash[:error] = "The financial instrument could not be saved.  Try again"
      redirect_to root_path
   end
    #financialinstrument = Financialinstrument.create financialinstrument_params
    #redirect_to(financialinstrument)
  end

  def show
  end

  def edit
  end

  def update
    @financialinstrument.update_attributes financialinstrument_params
    redirect_to(@financialinstrument)
  end

  def destroy
    @financialinstrument.delete
    redirect_to(financialinstruments_path)
  end

  private
    def financialinstrument_params
      params.require(:financialinstrument).permit(:instrument_type, :instrument_sub, :amount)
    end

    def load_instrument
      @financialinstrument = Financialinstrument.find(params[:id])
      redirect_to root_path unless @financialinstrument.user == current_user
    end
end



