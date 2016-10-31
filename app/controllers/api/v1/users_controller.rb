class Api::V1::UsersController < ApplicationController
  before_action :user_params

  def create
    @user = User.create user_params
    respond_to do |format|
      format.json { render json: { id: @user.id, auth_token: @user.auth_token} }
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end
end
