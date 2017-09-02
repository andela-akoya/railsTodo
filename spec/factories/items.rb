FactoryGirl.define do
  factory :item do
    name { Faker::GameOfThrones.character }
    done { Faker::Boolean.boolean(0.2) }
    todo_id nil
  end
end
