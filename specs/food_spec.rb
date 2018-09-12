require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../pub.rb')

class FoodTest < Minitest::Test

  def setup
    @food1 = Food.new("sandwich", 2.5, 1)
  end

  end
