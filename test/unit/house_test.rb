require 'test_helper'

class HouseTest < ActiveSupport::TestCase

  def setup
    @slytherin = House.new(:name => 'Slytherin')
    draco = Student.create(:name => "Draco Malfoy")
    voldemort = Student.create(:name => "Tom Riddle")
    draco.house  = voldemort.house = @slytherin
    draco.save!
    voldemort.save!
  end

  test "has a name attribute" do
    assert_equal @slytherin.name, 'Slytherin'
    assert(@slytherin.valid?)
  end

  test "invalid without a name" do
    hufflepuff = House.new
    assert(!hufflepuff.valid?)
  end

  test "can have many students" do
    assert_equal @slytherin.students[0].name, "Draco Malfoy"
    assert_equal @slytherin.students[1].name, "Tom Riddle" 
  end

end
