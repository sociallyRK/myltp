class User < ActiveRecord::Base
  has_secure_password
  has_many :financial_instruments
  has_many :real_estates
end
