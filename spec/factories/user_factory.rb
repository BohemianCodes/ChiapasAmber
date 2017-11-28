FactoryBot.define do

    factory :user do
        email "user@example.com"
        password "123456"
    end

    factory :admin, class: User do
      email "peter2@example.com"
      password "qwertyuiop"
      admin true
    end

    factory :product do
        name "Amber"
        image_url "http://www.example.com"
    end

    factory :comment do
      body "Okay"
      user
      product
      rating "3"
    end
end
