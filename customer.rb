class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age, drunkenness)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = drunkenness

  end

  def remove_money(money)
    @wallet -= money
  end

  def increase_drunkenness_level(alcohol_level)
    @drunkenness += alcohol_level
  end

  def decrease_drunkenness_level(rejuvenation_level)
    if @drunkenness > 0
      @drunkenness -= rejuvenation_level
    end
    return @drunkenness
  end
end
