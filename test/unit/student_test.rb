require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def setup
    @harry = Student.new(:name => "Harry Potter")
  end

  test "has a name attribute" do
    assert_equal @harry.name, "Harry Potter"
  end

  test "is invalid without a name" do
    ron = Student.new
    assert(!ron.valid?)
  end

end
