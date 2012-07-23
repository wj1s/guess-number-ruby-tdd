class Validator
  attr_accessor :number
  attr_accessor :input

  def verf
    all = (@input & @number).size
    a_number = getA()
    b_number = all - a_number
    return "#{a_number}A#{b_number}B"
  end

  def getA
    result = 0
    @input.each_with_index {|item,index|
      result += 1 if @number[index] == item
    }
    result
  end
end
