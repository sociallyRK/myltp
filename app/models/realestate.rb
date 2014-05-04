class Realestate < ActiveRecord::Base
  belongs_to :financialinstrument
  belongs_to :user
end
