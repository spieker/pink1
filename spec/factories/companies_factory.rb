FactoryGirl.define do
  factory :company do
    name 'Test company'

    after :create do |company|
      create_list :domain, 1, company: company
    end
  end
end
