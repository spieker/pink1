FactoryGirl.define do
  factory :user do
    company
    sequence(:email) { |n| 'user%03d@%s'%[n, company.domains.first.name] }
    password 'verysecret'
  end
end
