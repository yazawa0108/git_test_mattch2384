class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :encrypted_password, :reset_password_token, :profile_image, :birthday, :gender, :achievement, :betray_flg)
  end
end
