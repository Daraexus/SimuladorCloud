# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lineas_credito do
    name "MyString"
    annualRate 1.5
    user_id 1
  end
end
