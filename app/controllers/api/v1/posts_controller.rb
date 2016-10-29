class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.paginate page: params[:page], per_page: params[:per_page]
    respond_to do |format|
      format.json { render json: @posts }
    end
  end

  def show
    @errors = []

    @post = Post.find_by id: params[:id]
    if @post.nil?
      @errors << {code: 9, message: 'please, specify the correct id'}
    end

    respond_to do |format|
      format.json do
        if @errors.empty?
          render json: @post
        else
          render json: {
            errors: @errors
          }
        end
      end
    end
  end

  def create
    @title        = params[:title]
    @body         = params[:body]
    @published_at = params[:published_at]

    @errors = []

    @user = User.find_by auth_token: params['auth_token']

    if @user.nil?
      @errors << { code: 1, message: 'not authorized' }
    end

    if @title.nil?
      @errors << { code: 2, message: 'title is required' }
    end

    if @body.nil?
      @errors << { code: 3, message: 'body is required' }
    end

    @post = Post.create!(title:        @title,
                         body:         @body,
                         published_at: @published_at,
                         author:       @user) if @errors.empty?

    respond_to do |format|
      format.json do
        if @errors.empty?
          render json: @post
        else
          render json: {
            errors:  @errors
          }
        end
      end
    end
  end
end
