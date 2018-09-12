class Pub

  attr_reader :name, :till, :drinks, :food

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end

  def add_money_to_till(money)
    @till += money
  end

  def check_customer_age(customer)
    if customer.age >=18
      return true
    else
      return false
    end
  end

  def check_drunkenness_level(customer)
    if customer.drunkenness < 10
      return true
    else
      return false
    end
  end

  def sell_a_drink(drink, customer)
    if (check_drunkenness_level(customer) && check_customer_age(customer) && customer.wallet >= drink.price)
      customer.remove_money(drink.price)
      @till += drink.price
      customer.increase_drunkenness_level(drink.alcohol_level)
      for beverage in @drinks
        if beverage == drink
          @drinks.delete(beverage)
        end
      end
    end
  end

  def inventory()
    return @drinks.length
  end

  def sell_food(customer, food)
    if customer.wallet >= food.price
      customer.remove_money(food.price)
      @till += food.price
      customer.decrease_drunkenness_level(food.rejuvenation_level)
      for snack in @food
        if snack == food
          @food.delete(snack)
        end
      end
    end
  end

  def food_level
    return @food.length
  end

  def can_get_drink_stock(drink)
    # return @drinks["wine"][:stock_level]
    total_stock = 0
    @drinks.each do |key, array|
      array.each do |nested_key, nested_array|
        if nested_key == :stock_level
          total_stock +=  nested_array
        end
      end
    end
    return total_stock 
  end
end
