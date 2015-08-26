require 'spec_helper'

describe DataProvider::BseScrip, :redis do
  #it_should_behave_like "ActiveModel"

  let (:scrip) { DataProvider::BseScrip.new :id => "AANJANEYA",
                           :last_traded_price => "426.45",
                           :volume => "87942",
                           :open_price => "425.40",
                           :high_price => "432.5",
                           :low_price => "419.15",
                           :close_price => "421.90" }

  subject { scrip }

  its(:volume) { should eq 87942 }

  it "should be persisted" do
    scrip.save.should be_true
    scrip.persisted.should be_true
  end

  it "should have company" do
    company = create :'data_provider/company', :ticker_name => "AANJANEYA"
    scrip.company.should eq company
  end

  it "should update attributes" do
    scrip.update_attributes({ :volume => "10000", :open_price => "2300"}).should be_true
    scrip.persisted.should be_true
    scrip.volume.should eq 10000
    scrip.open_price.should be_a_indian_currency_of 2300
  end

  describe "with saved scrip" do
    before { scrip.save }
    it "should find a scrip by id" do
      scrip = DataProvider::BseScrip.find("AANJANEYA")
      scrip.should be_kind_of DataProvider::BseScrip
      scrip.last_traded_price.should be_a_indian_currency_of 426.45
    end

    it "should find all scrips" do
      DataProvider::BseScrip.all.should eq [scrip]
    end

    it "should return nil for a missing scrip" do
      DataProvider::BseScrip.find(999999999).should be_nil
    end

    its(:net_change) { should be_a_indian_currency_of 4.55 }
    its(:percent_change) { should eq 1.08 }

    describe "sort or reverse sort" do
      before(:each) {
        create :'data_provider/bse_scrip', :last_traded_price => 3, :close_price => 2, :id => "FOO1"
      }

      it "should find ids and sort by percent change" do
        scrip.update_attributes({ :close_price => "500"})
        bse_code = DataProvider::BseScrip.find_ids_and_sort_by(:percent_change, :limit => [0,5])
        DataProvider::BseScrip.find(bse_code.first).percent_change.should < 0
      end

      it "should find ids and reverse sort by percent change" do
        bse_code = DataProvider::BseScrip.find_ids_and_reverse_sort_by(:percent_change, :limit => [0,5])
        DataProvider::BseScrip.find(bse_code.first).percent_change.should > 0
      end
    end

    describe "using find or initialize" do
      it "should find a scrip by id" do
        scrip = DataProvider::BseScrip.find_or_initialize_by_id("AANJANEYA")
        scrip.should be_kind_of DataProvider::BseScrip
        scrip.last_traded_price.should be_a_indian_currency_of 426.45
      end

      it "should return new scrip for a missing scrip" do
        scrip = DataProvider::BseScrip.find_or_initialize_by_id("FOOBAR")
        scrip.should be_kind_of DataProvider::BseScrip
        scrip.id.should eq "FOOBAR"
        scrip.update_attributes({ :volume => "10000", :open_price => "2300"}).should be_true
        scrip.persisted.should be_true
        DataProvider::BseScrip.find("FOOBAR").volume.should eq 10000
        DataProvider::BseScrip.find("FOOBAR").open_price.should be_a_indian_currency_of 2300
      end
    end

    it "should find a scrip by last traded price range" do
      DataProvider::BseScrip.find_ids_by_last_traded_price( 420, 425 ).should eq []
      DataProvider::BseScrip.find_ids_by_last_traded_price( 426.25, 430 ).should eq ["AANJANEYA"]
    end

    it "should be destroyable" do
      destroyed_scrip = scrip.destroy
      destroyed_scrip.should eq scrip
      DataProvider::BseScrip.find(destroyed_scrip.id).should be_nil
    end

    it "should clear indices on destroyed scrips" do
      destroyed_scrip = scrip.destroy
      DataProvider::BseScrip.find_ids_by_last_traded_price( destroyed_scrip.last_traded_price, destroyed_scrip.last_traded_price ).should eq []
    end
  end

  it "should have top gainers" do
    6.times do |i|
      scrip = create :'data_provider/bse_scrip', :id => "GAINER#{i}", :last_traded_price => i+2, :close_price => i+1
      create :'data_provider/company', :ticker_name => scrip.id
    end
    DataProvider::BseScrip.top_gainers(5).map(&:percent_change).should eq [ 100, 50, 33.33, 25, 20 ]
  end

  it "should have top losers" do
    5.times do |i|
      scrip = create :'data_provider/bse_scrip', :id => "LOSER#{i}", :last_traded_price => i+1, :close_price => i+2
      create :'data_provider/company', :ticker_name => scrip.id
    end
    DataProvider::BseScrip.top_losers(5).map(&:percent_change).should eq [ -50, -33.33, -25, -20, -16.67 ]
  end

  it "should have most active scrips" do
    7.times do |i|
      scrip = create :'data_provider/bse_scrip', :id => "ACTIVE#{i}", :last_traded_price => i+1, :close_price => i+2, :volume => i*100000
      create :'data_provider/company', :ticker_name => scrip.id
    end
    DataProvider::BseScrip.most_active(5).map(&:volume).should eq [ 600000, 500000, 400000, 300000, 200000 ]
  end

   describe "Sectoral Indices" do
    it "should have sectoral indices" do
      create :'data_provider/bse_scrip', :id => 'BSE_CDS', :last_traded_price => 10, :close_price => 9
      create :'data_provider/bse_scrip', :id => 'BSE_HCS', :last_traded_price => 9, :close_price => 9.5
      DataProvider::BseScrip.sectoral_indices.count.should eq 2
      DataProvider::BseScrip.sectoral_indices.map(&:last_traded_price).should be_include_indian_currency_of(9,10)
    end
  end

end
