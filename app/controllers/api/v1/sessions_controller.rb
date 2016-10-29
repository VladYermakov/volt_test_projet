class Api::V1::SessionsController < ApplicationController
  def create
    @errors = []
    @nickname_or_email = params[:nickname] || params[:email]
    @sym = if !params[:email].nil?
             :email
           elsif !params[:nickname].nil?
             :nickname
           else
             :id
           end
    @password = params[:password]

    if @nickname_or_email.nil?
      @errors << { code: 4, message: 'please, specify the nickname or email' }
    else
      @nickname_or_email.downcase!
    end

    if @password.nil?
      @errors << { code: 5, message: 'please, specify the password' }
    end

    @user = User.find_by @sym => @nickname_or_email

    if @user && @user.authenticate(@password)
      @user.regenerate_auth_token
      @auth_token = @user.auth_token
    elsif @user
      @errors << { code: 7, message: 'wrong password' }
    else
      @errors << { code: 6, message: 'wrong email/nickname' }
    end

    respond_to do |format|
      format.json do
        if @errors.empty?
          render json: {
            auth_token: @auth_token
          }
        else
          render json: {
            errors: @errors
          }
        end
      end
    end
  end
end
