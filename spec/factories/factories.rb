require 'ffaker'
require 'factory_girl'
FactoryGirl.define do
  factory :organization do
    name { Faker::Company.name }
  end

  factory :store do
    organization
    name { Faker::Company.name }

    factory :store_with_proofs do

      after(:create) do |store, evaluator|
        store.proofs << FactoryGirl.create(:proof)
      end
    end
  end

  factory :proof do
    urgent_message { Faker::Lorem.paragraph }
    proof_deadline { Time.now + 3.days }
    in_home_date   { Time.now + 2.weeks }
    print_date     { Time.now + 1.week }
    pdf            { File.open("public/relationship_graph.pdf") }
  end

  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.name }
    password "password"

    factory :user_with_stores do

      after(:create) do |user, evaluator|
        user.stores << FactoryGirl.create(:store)
      end
    end

    factory :user_with_proofs do

     after(:create) do |user, evaluator|
       user.stores << FactoryGirl.create(:store_with_proofs)
     end
    end
  end
end
