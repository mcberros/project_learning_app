FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "project#{n}" }
    description 'Dummy'
  end

  factory :user do
    sequence :email do |n| 
      "foo#{n}@example.com"
    end
    password 'secret'
  end
end