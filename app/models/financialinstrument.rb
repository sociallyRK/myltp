class Financialinstrument < ActiveRecord::Base
  belongs_to :user
  
  def self.balancesheet(current_user)
    @financialinstruments = current_user.financialinstruments
    sum = 0
    @financialinstruments.each do |financialinstrument| 
      if financialinstrument.instrument_type == "asset"
        sum+= financialinstrument.amount
      elsif financialinstrument.instrument_type == "liability"
        sum-= financialinstrument.amount
      end
      end
    return sum
  end
  def self.incomestatement(current_user)
    @financialinstruments = current_user.financialinstruments
    sum = 0
    @financialinstruments.each do |financialinstrument| 
      if financialinstrument.instrument_type == "income"
        sum+= financialinstrument.amount
      elsif financialinstrument.instrument_type == "expense"
        sum-= financialinstrument.amount
      end
      end
    return sum
  end
end
