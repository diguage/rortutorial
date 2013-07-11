FactoryGirl.define do
  factory :user do
  	sequence(:name) { |n| "Person #{n}" }
  	sequence(:email) { |n| "person_#{n}@example.com" }
    password "adaiadai"
    password_confirmation "adaiadai"
    
    factory :admin do
      admin true      
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end	
end