require "validator"

describe Validator do
  it "should return 4A0B when type all right" do
    val = Validator.new
    val.number = [1,2,3,4]
    val.input = [1,2,3,4]
    val.verf().should == "4A0B"
  end

  it "should return 0A0B when type all wrong" do
    val = Validator.new
    val.number = [1,2,3,4]
    val.input = [5,6,7,8]
    val.verf().should == "0A0B"
  end

  it "should return 1A0B when type 1 right position" do
    val = Validator.new
    val.number = [1,2,3,4]
    val.input = [1,7,8,9]
    val.verf().should == "1A0B"
  end

  it "should return 0A1B when type 1 right number" do
    val = Validator.new
    val.number = [1,2,3,4]
    val.input = [7,1,8,9]
    val.verf().should == "0A1B"
  end

  it "should return 2A2B when type 2 right position and 2 right number" do
    val = Validator.new
    val.number = [1,2,3,4]
    val.input = [4,2,3,1]
    val.verf().should == "2A2B"
  end
end
