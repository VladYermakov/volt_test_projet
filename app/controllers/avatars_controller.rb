class AvatarsController < ApplicationController

  def show
    @size = (params[:size] || 'original').to_sym
    @user = User.find_by id: params[:id]
  end

  def update
    @user = User.find_by auth_token: params[:auth_token]
    @avatar = params[:avatar]

    @user.update! avatar: @avatar
  end
end
