FactoryGirl.define do
  factory :tag do
  	sequence :name do |n|
      "Gasoline #{n}"
    end
  end
end