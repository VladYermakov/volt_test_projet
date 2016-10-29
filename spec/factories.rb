FactoryGirl.define do

  factory :user, aliases: [:author] do

    sequence(:nickname)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password '12312312'
    password_confirmation '12312312'

  end

  factory :post do

    sequence(:title) { |n| "post #{n}" }
    body 'Lorem ipsum'
    author

  end

  factory :comment do

    body 'comment one'
    author
    post

  end

end