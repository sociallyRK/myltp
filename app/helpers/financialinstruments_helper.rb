module FinancialinstrumentsHelper
      def check_financialinstruments_owner
    financialinstruments = current_user.financialinstruments.where(:id => params[:id]).first
    if financialinstrument.nil?
      flash[:error] = "That's not your financial instrument."
      redirect_to financialinstrument(params[:id])
    end
  end
end
