require 'spec_helper'

describe DataProvider::AnnouncementsAgmbc do
  let(:company) { create :'data_provider/company' }
  let(:announcements_agmbc) { create :'data_provider/announcements_agmbc', :company_code => company.code,
                                                            :date_of_announcement => "12/01/2012",
                                                            :agm_date => "12/01/2012",
                                                            :remarks => "Remarks" }
  subject { announcements_agmbc }
  its(:remarks) { should eq "Remarks" }
  it "should get the record by company_code" do
    DataProvider::AnnouncementsAgmbc.find_or_initialize_by( company_code: company.code, date_of_announcement: announcements_agmbc.date_of_announcement, agm_date: announcements_agmbc.agm_date ).should eq announcements_agmbc
  end
end
