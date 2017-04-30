FactoryGirl.define do
  factory :idea do
  	title "Enfield"
  	description "Made like a gun"
  	after(:build) do |idea|
  	  idea.owner = build(:user)
  	end
  end
end