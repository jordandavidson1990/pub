require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')

class CustomerTest < Minitest::Test

  def setup
    @customer1 = Customer.new("John", 10.00, 30, 0)
  end

  def test_remove_money
    @customer1.remove_money(2)
    assert_equal(8, @customer1.wallet)
  end

  def test_drunkenness_level
    assert_equal(2, @customer1.increase_drunkenness_level(2))
  end

  def test_rejuvenation_level
    assert_equal(0, @customer1.decrease_drunkenness_level(1))
end
end
