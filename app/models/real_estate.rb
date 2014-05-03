class RealEstate < ActiveRecord::Base
  belongs_to :financial_instrument
  belongs_to :user
end
