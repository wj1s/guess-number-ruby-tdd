require "number_creater"

describe NumberCreater do
  it "should return [1,2,3,4] when random create number 1234" do
     ranStub = double("ruby random stub")
     ranStub.stub(:rand).with(10000).and_return(1234)
     number = NumberCreater.new ranStub
     number.create().should == [1,2,3,4]
  end

  it "should return [0,1,2,3] when random create number 123" do
     ranStub = double("ruby random stub")
     ranStub.stub(:rand).with(10000).and_return(123)
     number = NumberCreater.new ranStub
     number.create().should == [0,1,2,3]
  end

  it "should crate again  when random create number have duplied number" do
     ranStub = double("ruby random stub")
     ranStub.stub(:rand).with(10000).and_return(113,1234)
     number = NumberCreater.new ranStub
     number.create().should == [1,2,3,4]
  end

  it "should crate again  when random create number have 0" do
     ranStub = double("ruby random stub")
     ranStub.stub(:rand).with(10000).and_return(103,130,1234)
     number = NumberCreater.new ranStub
     number.create().should == [1,2,3,4]
  end

  it "should crate again  when random create number <100" do
     ranStub = double("ruby random stub")
     ranStub.stub(:rand).with(10000).and_return(99,1234)
     number = NumberCreater.new ranStub
     number.create().should == [1,2,3,4]
  end
end
