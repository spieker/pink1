FactoryGirl.define do
  factory :alias do
    user
    sequence(:source) do |n|
      'alias%03d@%s'%[n, user.company.domains.first.name]
    end
  end
end

