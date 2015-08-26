require 'spec_helper'

describe DataProvider::Bonus, :mongoid do
  let(:company) { create :'data_provider/company' }
  let(:bonus) { create :'data_provider/bonus', :company_code => company.code, :year_ending => "15/06/2011", :ratio => '1:1', :xb_date => '02/08/2011' }
  subject { bonus }

  its(:ratio) { should eq '1:1' }
  it "should find the record" do
    DataProvider::Bonus.find_or_initialize_by( company_code: company.code, :year_ending => bonus.year_ending ).should eq bonus
  end

end
