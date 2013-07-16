FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "project#{n}" }
    description 'Dummy'
  end
end