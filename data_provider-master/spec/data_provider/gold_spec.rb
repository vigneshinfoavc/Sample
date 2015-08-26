require 'spec_helper'

describe DataProvider::Gold, :redis do
  before { create :'data_provider/nse_scrip', :last_traded_price => 10, :close_price => 9, :id => "GOLDBEES" }
  subject { DataProvider::Gold }

  its(:last_traded_price) { should be_a_indian_currency_of 10    }
  its(:net_change)        { should be_a_indian_currency_of 1     }
  its(:percent_change)    { should eq 11.11 }
end
