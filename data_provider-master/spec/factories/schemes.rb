# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :'data_provider/scheme' do
    sequence(:security_code, Time.now.to_i) { |n| n.to_s }
    sequence(:name, Time.now.to_i) { |n| "scheme_#{n}" }
    sequence(:company_code, Time.now.to_i + 3 ) { |n| n }
    class_code "2063"
    type_description "Open Ended"
    class_description "Special Fund"
    launch_date "02/03/2001"
    plan_description "Growth"
    minimum_investment_amount "5000"
    size "296.38"
    entry_load nil
    exit_load nil
    redemption_frequency "Daily"
    sip "True"
    fund_manager_prefix "Mr."
    fund_manager_name "Chirag Setalvad"
    delete_flag "False"

   end
end
