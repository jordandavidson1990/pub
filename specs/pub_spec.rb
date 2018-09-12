require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../food.rb')
# Pub can have a stock (maybe a Hash?) to keep track the
# amount of drinks available (Hard! Might need to change the drinks array to a drinks hash)
class PubTest < Minitest:: Test
  def setup
    @drink1 = Drink.new("wine", 4.50, 2)
    @drink2 = Drink.new("beer", 3.00, 1)
    # drinks = [@drink1]
    drinks =
    {
      "wine" =>
      {
        name: "wine",
        price: 4.50,
        alcohol_level: 2,
        stock_level: 10
      },
      "beer" =>
      {
        name: "beer",
        price: 3,
        alcohol_level: 1,
        stock_level: 20
      }
    }
    @food1 = Food.new("sandwich", 2.5, 1)
    food =[@food1]

    @pub1 = Pub.new("ABC", 100, drinks, food)

    @customer1 = Customer.new("Chris", 10, 30, 0)
    @customer2 = Customer.new("Kim", 8, 18, 11)

  end

  def test_add_money_to_till
    @pub1.add_money_to_till(10)
    assert_equal(110, @pub1.till)
  end

  def test_sell_a_drink
    @pub1.sell_a_drink(@drink1, @customer1)
    assert_equal(2, @customer1.drunkenness)
    assert_equal(5.50, @customer1.wallet)
    #test for adding the money to pub's till
    assert_equal(104.50, @pub1.till)
    assert_equal(2, @pub1.inventory)
  end

  def test_sell_a_drunk
    @pub1.sell_a_drink(@drink1, @customer2)
    assert_equal(11, @customer2.drunkenness)
    assert_equal(8, @customer2.wallet)
    assert_equal(100, @pub1.till)
  end

  def test_age
    result = @pub1.check_customer_age(@customer1)
    assert_equal(true, result)
  end

  def test_level_of_drunkenness
    result = @pub1.check_drunkenness_level(@customer1)
    assert_equal(true, result)
  end

  def test_inventory
    assert_equal(2, @pub1.inventory)
  end

  def test_food_level
    assert_equal(1, @pub1.food_level)
  end

  def test_sell_food_to_customer
    @pub1.sell_food(@customer1, @food1)
    assert_equal(0, @customer1.drunkenness)
    assert_equal(7.50, @customer1.wallet)
    assert_equal(102.50, @pub1.till)
    assert_equal(0, @pub1.food_level)
  end

  def test_can_get_drink_stock
    assert_equal(30, @pub1.can_get_drink_stock(@drink1))
  end
end
