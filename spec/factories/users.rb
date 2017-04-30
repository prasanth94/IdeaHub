FactoryGirl.define do
  factory :user do
  	sequence :email do |n|
      "prasanth#{n}@gmail.com"
    end
  	password "123456"
  end
end