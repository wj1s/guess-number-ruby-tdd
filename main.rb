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
    count = 0
    begin
      count = count + 1
      input = getInput
      result = validateNumber(number,input)
      p result
    end until result == "4A0B" || count == 6
    if (result == "4A0B")
      p "congratulations!"
    else
      p "you lost,number is #{number}"
    end
  end

  private
  def getInput
    begin
      input = gets().strip
      result = []
      input.each_char {|x| result.push x.to_i}
      p "must 4 chars" if input.size != 4
      p "not dup." if result.uniq.size != result.size
    end until input.size == 4 && result.uniq.size == result.size
    return result
  end

  def validateNumber(number,input)
    @validator.number = number
    @validator.input = input
    @validator.verf
  end

end

if __FILE__ == $0
  ran = Random.new
  numberCreater = NumberCreater.new ran
  validator = Validator.new
  x = Main.new(numberCreater,validator)
  x.run
end
