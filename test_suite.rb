require 'minitest/autorun'
require 'minitest/pride'

require './department.rb'
require './employee.rb'

class ReviewsTest < Minitest::Test
def test_classes_exist
assert Department
assert Class
end

def test_can_create_department
   dep = Department.new("Balogna")
   assert dep
  assert_equal "Balogna", dep.name
end

def test_can_create_employee
  employee1 = Employee.new("John Dough", "johndough@gmail.com", "123-123-1234", "50,000")
  assert employee1
  assert_equal "John Dough", employee1.name
  assert_equal "johndough@gmail.com", employee1.email
  assert_equal "123-123-1234", employee1.phone
  assert_equal "50,000", employee1.salary

end

  # @name = name
  # @email = email
  # @phone = phone
  # @salary = salary



end