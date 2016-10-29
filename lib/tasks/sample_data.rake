namespace :db do
  desc 'fill the database with sample data'
  task populate: :environment do
    create_users
    create_posts
    create_comments
  end
end

def create_users
  10.times do
    nickname = Faker::Internet.user_name
    email = Faker::Internet.email(nickname)
    password = Faker::Internet.password

    User.create! nickname: nickname, email: email,
                 password: password, password_confirmation: password

  end
end

def create_posts
  User.find_each do |user|
    7.times do
      title = Faker::Lorem.word
      body = Faker::Lorem.sentences(1..3)

      user.posts.create! title: title, body: body
    end
  end
end

def create_comments
  User.find_each do |user|
    7.times do
      body = Faker::Lorem.sentences(1..2)
      post = Post.all.sample

      post.comments.create! body: body, author_id: user.id
    end
  end
end