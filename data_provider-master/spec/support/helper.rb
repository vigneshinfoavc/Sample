#named scope tests
def test_named_scope(all_objects, subset, condition)
  scoped_objects, other_objects = all_objects.partition(&condition)
  scoped_objects.should_not be_empty
  other_objects.should_not be_empty
  scoped_objects.should == subset
  other_objects.should == all_objects - subset
end

RSpec::Matchers.define :be_a_indian_currency_of do |expected|
  match do |actual|
    actual.should eq IndianCurrency.new(expected)
  end
end

RSpec::Matchers.define :be_include_indian_currency_of do |*expected|
  match do |actual|
    actual.should =~ expected.map{|e| IndianCurrency.new(e) }
  end
end
