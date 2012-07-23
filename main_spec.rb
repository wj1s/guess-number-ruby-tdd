require "main"

describe Main do
  it "should work right in main." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([1,2,3,4])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([1,2,3,4])
    validatorMock.should_receive(:input=).with([1,2,3,4])
    validatorMock.should_receive(:verf).and_return("4A0B")
    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = -1
    getsFixtures = ["1234"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        getsCallNumber = getsCallNumber + 1
        getsFixtures[getsCallNumber]
      end
    end
    main.run
    #p putResult
    putResult.size.should == 2
    putResult[1].should == "4A0B"
  end
end
