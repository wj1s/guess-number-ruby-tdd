class NumberCreater

  def initialize ran
    @random = ran
  end

  public
  def create
    begin
     res = tranNumberToArray createNumber
    end until checkNoDup res
    return res
  end

  def tranNumberToArray number
    res = []
    res.push 0 if number < 1000
    number.to_s.each_char {|x| res.push x.to_i}
    return res
  end

  private
  def checkNoDup arr
    return arr.uniq.size == arr.size
  end

  def createNumber
    begin
      res = @random.rand 10000
    end until res > 99
    return res
  end

end
