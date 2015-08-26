require 'spec_helper'

describe Dion::NAVCategoryDetails do
  it "should create a new Net Asset Value Category record" do
    Dion::NAVCategoryDetails.find_and_update_attributes( :scheme_class_code => '2120', :no_of_schemes => '12')
    DataProvider::NetAssetValueCategory.exists?( :conditions => { :scheme_class_code => '2120', :no_of_schemes => 12 }).should be_true
  end
end
