require 'minitest/autorun'
require 'minitest/pride'
require './department.rb'
require './employee.rb'
require 'byebug'

class ReviewsTest < Minitest::Test
  def test_classes_exist
    assert Department
    assert Class
  end

  def test_can_create_department
     dep = Department.new("Balogna")
     assert dep
    assert_equal "Balogna", dep.dept_name
  end

  def test_can_create_employee
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    assert employee1
    assert_equal "John Dough", employee1.name
    assert_equal employee1.name, "John Dough"
    assert_equal "johndough@gmail.com", employee1.email
    assert_equal "123-123-1234", employee1.phone
    assert_equal 10000, employee1.salary
  end

  def test_can_add_employee_to_department
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    assert employee1
    assert dep
    dep.add_employee(employee1)
    assert_equal "John Dough", dep.employee_list[0].name
    assert_equal "johndough@gmail.com", dep.employee_list[0].email
    assert_equal "123-123-1234", dep.employee_list[0].phone
    assert_equal 10000, dep.employee_list[0].salary
  end

  def test_get_employees_name
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    dep.add_employee(employee1)
    assert_equal "John Dough", employee1.name
    assert_equal "John Dough", dep.employee_list[0].name
  end

  def test_get_employees_salary
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    dep.add_employee(employee1)
    assert_equal 10000, employee1.salary
    assert_equal 10000, dep.employee_list[0].salary
  end

  def test_get_department_name
    dep = Department.new("Balogna")
    assert_equal "Balogna", dep.dept_name
  end

  def test_get_department_salary
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    dep.add_employee(employee1)
    dep.add_employee(employee2)
    dep.get_total_salary
    assert_equal 60000, dep.get_total_salary
  end

  def test_add_review_test
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    employee1.add_review("John Dough is a great guy!")
    assert_equal "John Dough is a great guy!", employee1.review
  end

  def test_mark_satisfactory
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    employee2.mark_satisfactory(true)
    assert_equal true, employee2.satisfactory
  end

  def test_give_raise_to_employee
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    employee2.give_raise(5000)
    assert_equal 55000, employee2.salary
  end

  def test_give_raise_to_department
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    dep.add_employee(employee1)
    dep.add_employee(employee2)
    assert_equal 60000, dep.get_total_salary
    employee2.mark_satisfactory(true)
    assert_equal true, employee2.satisfactory
    employee1.mark_satisfactory(true)
    assert_equal true, employee1.satisfactory
    dep.give_raise(5000)
    assert_equal 65000, dep.get_total_salary
    assert_equal 52500, employee2.salary
    assert_equal 12500, employee1.salary
  end

end
