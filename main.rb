$LOAD_PATH.unshift File.expand_path(File.dirname($PROGRAM_NAME))
require "number_creater"
require "validator"

class Main
  def initialize(numberCreater,validator)
    @numberCreater = numberCreater
    @validator = validator
  end

  def run
    number = @numberCreater.create
    p "please type 4 number."
    input = gets
    inputArr = []
    input.each_char {|x| inputArr.push x.to_i}
    @validator.number = number
    @validator.input = inputArr
    p @validator.verf
  end
end

if __FILE__ == $0
  ran = Random.new
  numberCreater = NumberCreater.new ran
  validator = Validator.new
  x = Main.new(numberCreater,validator)
  x.run
end
