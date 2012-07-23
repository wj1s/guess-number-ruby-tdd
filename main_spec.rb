require "main"

describe Main do
  it "should work right in main." do
    RSpec::Core::ExampleGroup::Nested_1.instance_eval do define_method :puts do |message| p "afdafaa" end end
    puts "wjwjwjwjwj"
  end
end
