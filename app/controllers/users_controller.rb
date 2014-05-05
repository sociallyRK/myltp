class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    #@fin_inst = @user.financialinstruments.build
    #@fin_inst.build_realestate
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the My Long Term Plan App!"
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "Failed to create account.  Try again."
      redirect_to new_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :personal_income, :spouse_name, :birthdate, :spouse_income, :email, :password, :password_confirmation)
    end
end

#passwords not saved to the database; bcrypt - the password (has secure password)
#Model has has secure passwordschema 
#added password_digest

#rm -rf test/models/superusers_test.rb
#hassecurepassword connects to password_digest
#rails g migration AddPasswordDigestToSuperUsers password_digest:string 
#RemovePasswordDigestFromSuperUsers