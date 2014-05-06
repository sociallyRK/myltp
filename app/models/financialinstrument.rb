class Financialinstrument < ActiveRecord::Base
  belongs_to :user
  def self.sum_of_financialinstrument(current_user)
    @financialinstruments = current_user.financialinstruments
    sum = 0
    @financialinstruments.each do |financialinstrument| 
    sum+= financialinstrument.amount
    end
    return sum
  end
end
