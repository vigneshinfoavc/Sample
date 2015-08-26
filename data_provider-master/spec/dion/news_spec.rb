require 'spec_helper'

describe Dion::News do

  it "should create/update a news record" do
    Dion::News.find_and_update_attributes( :company_code => '230', :news_date => '10/02/2012',
                                           :headlines => 'Indian refiners seek 2.6 million barrels extra supplies from Saudi Aramco: Sources',
                                           :source_name => 'Religare Technova' )
    (news = DataProvider::News.where(:company_code => '230', :news_date => '10/02/2012',
                      :headlines => 'Indian refiners seek 2.6 million barrels extra supplies from Saudi Aramco: Sources').first).should_not be_nil
    news.source_name.should eq 'Religare Technova'
  end
end
