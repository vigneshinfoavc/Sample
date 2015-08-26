require 'spec_helper'

describe Dion::NavMaster do

  it "should create/update scheme" do
    create :'data_provider/scheme', :security_code => '13520030.002067'
    Dion::NavMaster.find_and_update_attributes( :security_code => '13520030.002067', :mapping_code => '116498',
																								:scheme_code => '13520030', :bench_mark_index_name => 'Nse Index')
    (scheme = DataProvider::Scheme.where( :security_code => '13520030.002067').first).should_not be_nil
    scheme.mapping_code.should eq '116498'
		scheme.code.should eq '13520030'
    scheme.bench_mark_index_name.should eq 'Nse Index'
  end

 end
