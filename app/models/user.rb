class User < ActiveRecord::Base
  has_secure_password

  before_save { |user| user.email = email.downcase }
  #makes everything downcase
  before_save :create_remember_token
  #calls create_remember_token down below

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :financialinstruments, dependent: :destroy
  has_many :realestates, dependent: :destroy

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    #another layer of protection
end
