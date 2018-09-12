require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

def setup
    @drink1 = Drink.new("Mojito", 4.0, 2)
end

end
