FactoryGirl.define do
  factory :domain do
    company
    sequence(:name) { |n| 'sub%03d.example.com'%[n] }
  end
end
