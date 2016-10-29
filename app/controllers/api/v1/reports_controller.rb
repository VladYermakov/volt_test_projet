class Api::V1::ReportsController < ApplicationController

  def show
    @start_date = params[:start_date]
    @end_date   = params[:end_date]
    @email      = params[:email]

    @errors = []

    @start_date ||= Date.parse '01/01/0001'
    @end_date   ||= Date.today

    if @email.nil?
      @errors << { code: 10, message: 'please, specify email' }
    end

    query_posts = <<-POSTS
SELECT
  CASE
    WHEN SUM(CASE
               WHEN users.id = posts.author_id
                 THEN 1
               ELSE 0
             END) IS NOT NULL
      THEN SUM(CASE
                 WHEN users.id = posts.author_id
                   THEN 1
                 ELSE 0
               END)
    ELSE 0
  END AS total_posts
FROM posts
WHERE published_at BETWEEN '#{@start_date}' AND '#{@end_date} 23:59:59'
POSTS
    query_comments = <<-COMMENTS
SELECT
  CASE
    WHEN SUM(CASE
               WHEN users.id = comments.author_id
                 THEN 1
               ELSE 0
             END) IS NOT NULL
      THEN SUM(CASE
                 WHEN users.id = comments.author_id
                   THEN 1
                 ELSE 0
               END)
    ELSE 0
  END AS total_comments
FROM comments
WHERE published_at BETWEEN '#{@start_date}' AND '#{@end_date} 23:59:59'
COMMENTS

    @analytics = User.select(:nickname, :email, "(#{query_posts})", "(#{query_comments})")
        .order("(#{query_posts}) + (#{query_comments}) / 10::float DESC")
        .map do |x|
          {
            'nickname' => x.nickname,
            'email' => x.email,
            'total_posts' => x.total_posts,
            'total_comments' => x.total_comments
          }
    end

    respond_to do |format|
      format.json do
        if @errors.empty?
          EmailJob.perform_later @email, helpers.to_table(@analytics), @start_date.to_s, @end_date.to_s
          render json: { message: 'Report generation started' }
        else
          render json: { errors: @errors }
        end
      end
    end
  end
end
