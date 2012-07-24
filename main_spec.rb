require "main"

describe Main do
  it "should work right in main guess one time." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([1,2,3,4])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([1,2,3,4])
    validatorMock.should_receive(:input=).with([1,2,3,4])
    validatorMock.should_receive(:verf).and_return("4A0B")

    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = 0
    getsFixtures = ["1234\n"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        input = getsFixtures[getsCallNumber]
        getsCallNumber = getsCallNumber + 1
        return input
      end
    end

    main.run
    putResult.should == ["please type 4 number.","4A0B","congratulations!"]
  end

  it "should work right in main guess many times." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([2,8,0,7])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([2,8,0,7]).exactly(4).times
    validatorMock.should_receive(:input=).with([1,2,3,4]).ordered
    validatorMock.should_receive(:input=).with([5,6,7,8]).ordered
    validatorMock.should_receive(:input=).with([3,4,5,6]).ordered
    validatorMock.should_receive(:input=).with([2,8,0,7]).ordered
    validatorMock.should_receive(:verf).and_return("0A1B","0A2B","0A0B","4A0B")

    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = 0
    getsFixtures = ["1234\n","5678\n","3456\n","2807\n"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        input = getsFixtures[getsCallNumber]
        getsCallNumber = getsCallNumber + 1
        return input
      end
    end

    main.run
    putResult.should == ["please type 4 number.","0A1B","0A2B","0A0B","4A0B","congratulations!"]
  end

  it "should work right in main guess more than 6 times." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([2,8,0,7])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([2,8,0,7]).exactly(6).times
    validatorMock.should_receive(:input=).with([1,2,3,4]).ordered
    validatorMock.should_receive(:input=).with([5,6,7,8]).ordered
    validatorMock.should_receive(:input=).with([3,4,5,6]).ordered
    validatorMock.should_receive(:input=).with([3,1,4,2]).ordered
    validatorMock.should_receive(:input=).with([5,1,4,2]).ordered
    validatorMock.should_receive(:input=).with([8,9,1,0]).ordered
    validatorMock.should_receive(:verf).and_return("0A1B","0A2B","0A0B","0A1B","0A1B","0A2B")

    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = 0
    getsFixtures = ["1234\n","5678\n","3456\n","3142\n","5142\n","8910\n","9012\n"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        input = getsFixtures[getsCallNumber]
        getsCallNumber = getsCallNumber + 1
        return input
      end
    end

    main.run
    putResult.should == ["please type 4 number.","0A1B","0A2B","0A0B","0A1B","0A1B","0A2B","you lost,number is #{[2,8,0,7]}"]
  end

  it "should work right in main guess more than 6 times." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([3,2,0,9])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([3,2,0,9]).exactly(6).times
    validatorMock.should_receive(:input=).with([3,4,5,6]).exactly(6).times
    validatorMock.should_receive(:verf).and_return("1A0B","1A0B","1A0B","1A0B","1A0B","1A0B")

    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = 0
    getsFixtures = ["123\n","56798\n","3456\n","3456\n","3456\n","3456\n","3456\n","3456\n","3456\n"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        input = getsFixtures[getsCallNumber]
        getsCallNumber = getsCallNumber + 1
        return input
      end
    end

    main.run
    putResult.should == ["please type 4 number.","must 4 chars","must 4 chars","1A0B","1A0B","1A0B","1A0B","1A0B","1A0B","you lost,number is #{[3,2,0,9]}"]
  end

  it "should work right in main guess more than 6 times." do
    numberCreaterMock = double("number creater mock")
    numberCreaterMock.should_receive(:create).and_return([3,2,0,9])
    validatorMock = double("validator mock")
    validatorMock.should_receive(:number=).with([3,2,0,9]).exactly(6).times
    validatorMock.should_receive(:input=).with([3,4,5,6]).exactly(6).times
    validatorMock.should_receive(:verf).and_return("1A0B","1A0B","1A0B","1A0B","1A0B","1A0B")

    main = Main.new(numberCreaterMock,validatorMock)
    putResult = []
    getsCallNumber = 0
    getsFixtures = ["1134\n","2000\n","3456\n","3456\n","3456\n","3456\n","3456\n","3456\n","3456\n"]
    main.instance_eval do
      define_singleton_method :p do |message|
        putResult.push message
      end
      define_singleton_method :gets do
        input = getsFixtures[getsCallNumber]
        getsCallNumber = getsCallNumber + 1
        return input
      end
    end

    main.run
    putResult.should == ["please type 4 number.","not dup.","not dup.","1A0B","1A0B","1A0B","1A0B","1A0B","1A0B","you lost,number is #{[3,2,0,9]}"]
  end
end
