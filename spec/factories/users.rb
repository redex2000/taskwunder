FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password '12345678'
    full_name { FFaker::Name.name }
    birth_date { Date.today - 20.years }

  end
end
