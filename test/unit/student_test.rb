require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @harry = Student.new(:name => "Harry Potter")
    @harry.save!
  end

  test "has a name attribute" do
    assert_equal @harry.name, "Harry Potter"
  end

  test "is invalid without a name" do
    ron = Student.new
    assert(!ron.valid?)
  end

  test "belongs to a house and is assigned on create" do
    assert @harry.house
  end

end
