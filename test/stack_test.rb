require 'minitest/autorun'
require 'stack'

class TestStack < MiniTest::Unit::TestCase

  def setup
    # Create some data
    @data1 = StackData.new 'data1'
    @data2 = StackData.new 'data2'
    @data3 = StackData.new 'data3'
    @data4 = StackData.new 'data4'
    @data5 = StackData.new 'data5'
  end

  def test_push_method
    @stack = Stack.new

    # Push data1 onto stack and pop it to see it was on there.
    @stack.push(@data1)
    assert_equal @stack.pop, @data1.id
  end

  def test_pop_method
    @stack = Stack.new

    # Try popping empty stack
    assert_raises RuntimeError do
      @stack.pop
    end

    # Push data onto stack and pop one, add more data, pop again.
    @stack.push(@data1)
    @stack.push(@data2)
    @stack.push(@data3)

    assert_equal @stack.pop, @data3.id
    @stack.push(@data4)
    @stack.push(@data5)
    assert_equal @stack.pop, @data5.id
  end
end
