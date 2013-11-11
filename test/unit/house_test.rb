require 'test_helper'

class HouseTest < ActiveSupport::TestCase

  test "has a name attribute" do
    slytherin = House.new(:name => 'Slytherin')
    assert_equal slytherin.name, 'Slytherin'
    assert(slytherin.valid?)
  end

  test "invalid without a name" do
    slytherin = House.new
    assert(!slytherin.valid?)
  end

end
