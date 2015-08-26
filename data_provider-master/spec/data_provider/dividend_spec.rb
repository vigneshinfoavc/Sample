require 'spec_helper'

describe DataProvider::Dividend, :mongoid do
  let(:company) { create :'data_provider/company' }
  let(:dividend) { create :'data_provider/dividend', :company_code => company.code, :date_of_announcement => "31/12/2011", :instrument_type => '1', :percentage => '15' }
  subject { dividend }

  its(:percentage) { should eq BigDecimal.new('15') }
  it "should find the record" do
    DataProvider::Dividend.find_or_initialize_by( company_code: company.code, :date_of_announcement => dividend.date_of_announcement ).should eq dividend
  end
end
