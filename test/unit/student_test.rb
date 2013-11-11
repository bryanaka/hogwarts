require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @gryffindor = House.create(:name => "Gryffindor")
    @harry = Student.new(:name => "Harry Potter")
    @harry.house = @gryffindor
    @harry.save!
  end

  test "has a name attribute" do
    assert_equal @harry.name, "Harry Potter"
  end

  test "is invalid without a name" do
    ron = Student.new
    assert(!ron.valid?)
  end

  test "belongs to a house" do
    assert_equal @harry.house, @gryffindor
  end

end
