require 'spec_helper'
require 'percentage'

describe Percentage do

	let(:percent) { Percentage.new(10.51) }

	subject { percent }

	its(:to_percent){ should eq '10.51 %' }

  it "should round the digit" do
		percent.should eq 10.51
  end
end
