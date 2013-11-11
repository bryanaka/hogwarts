require 'test_helper'

class HouseTest < ActiveSupport::TestCase

  test "invalid without a name" do
    slytherin = House.new( :name => 'Slytherin' )
    assert !slytherin.valid?
  end

end
