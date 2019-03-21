class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!

    if @user.save
      # If user saves in the db successfully:
      session[:user_id] = @user_id
      flash[:sucess] = "Account created successfully!"
      redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      redirect_to '/signup'
    end
  end

# private

#   def user_params
#     # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
#     # that can be submitted by a form to the user model #=> require(:user)
#     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
#   end

end