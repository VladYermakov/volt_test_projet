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

    User.create! nickname: nickname, email: email, password: password

  end
end

def create_posts
  User.find_each do |user|
    rand(10).times do
      title = ''
      while title.length < 2
        title = Faker::Lorem.word[0...30]
      end
      body = ''
      while body.length < 3
        body = Faker::Lorem.sentences(1..3).join[0...200]
      end

      user.posts.create! title: title, body: body
    end
  end
end

def create_comments
  User.find_each do |user|
    rand(10).times do
      body = ''
      while body.length < 5
        body = Faker::Lorem.sentences(1..2).join[0...140]
      end
      post = Post.all.sample

      post.comments.create! body: body, author: user
    end
  end
end