require 'spec_helper'
require 'corporate_data_updater/helpers'

describe PinchResponse do
  let(:mock_http_response) { double('mock http response') }
  let(:response) { PinchResponse.new(mock_http_response) }
  subject { response }

  it "should yield data to an io object" do
    response.should_receive(:read_body)
                      .and_yield("lorem ipsum\uC000\x0Cdoler sit amet".force_encoding('ASCII-8BIT'))

    data = ''
    response.stream do |io|
      io.should be_an IO
      data << io.read(30)
    end
    data.should == "lorem ipsum\ndoler sit amet"
  end
end

describe String do
  subject { "lorem ipsum\uC000\x0Cdoler sit amet".force_encoding('ASCII-8BIT') }
  its(:sanitize) { should eq "lorem ipsum\ndoler sit amet" }
end
