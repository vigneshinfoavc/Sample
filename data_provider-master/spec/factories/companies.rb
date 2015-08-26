# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :'data_provider/company' do
    sequence(:code, Time.now.to_i) { |n| n.to_s }
    sequence(:name, Time.now.to_i) { |n| "Company#{n}" }
    sequence(:nse_code, Time.now.to_i) { |n| "SYM#{n}" }
    industry_name "default_sector"

    trait :with_scrip do
      after(:create) do |company|
        FactoryGirl.create :'data_provider/nse_scrip', :id => company.nse_code
      end
    end
    factory :company_with_scrip, :traits => [:with_scrip]
  end
end
