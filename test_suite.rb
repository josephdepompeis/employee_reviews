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

  def test_add_review
    employee1 = Employee.new(email: "johndough@gmail.com",name: "John Dough",phone: "123-123-1234",salary: 10000)
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

  def test_give_raise_to_satisfactory_department
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    employee3 = Employee.new(name: "Mike Jones",email: "palefriend@gmail.com",phone: "444-343-3333",salary: 100000)

    dep.add_employee(employee1)
    dep.add_employee(employee2)
    dep.add_employee(employee3)
    assert_equal 160000, dep.get_total_salary
    employee2.mark_satisfactory(true)
    assert_equal true, employee2.satisfactory
    employee1.mark_satisfactory(true)
    assert_equal true, employee1.satisfactory
    dep.give_satisfactory_raise(5000)
    assert_equal 165000, dep.get_total_salary
    assert_equal 52500, employee2.salary
    assert_equal 12500, employee1.salary
    assert_equal 100000, employee3.salary
  end

  ##PHASE 2
  def test_give_targeted_to_department
    dep = Department.new("Balogna")
    employee1 = Employee.new(name: "John Dough",email: "johndough@gmail.com",phone: "123-123-1234",salary: 10000)
    employee2 = Employee.new(name: "Cathy Talker",email: "bighorn@gmail.com",phone: "333-343-5463",salary: 50000)
    employee3 = Employee.new(name: "Mike Jones",email: "palefriend@gmail.com",phone: "444-343-3333",salary: 100000)
    dep.add_employee(employee1)
    dep.add_employee(employee2)
    dep.add_employee(employee3)
    dep.give_targeted_raise(5000) {|e| e.salary < 100000}
    assert_equal 165000, dep.get_total_salary
    assert_equal 52500, employee2.salary
    assert_equal 12500, employee1.salary
    assert_equal 100000, employee3.salary

    #using method to do satisfactory test
    employee3.mark_satisfactory(true)
    dep.give_targeted_raise(5000) {|e| e.satisfactory == true}
    assert_equal 170000, dep.get_total_salary
    assert_equal 52500, employee2.salary
    assert_equal 12500, employee1.salary
    assert_equal 105000, employee3.salary
  end

  def test_get_review_from_file
    employee4 = Employee.new(name: "Susan McMooth",email: "suzieM@gmail.com",phone: "994-167-1466",salary: 40000)
    employee4.add_review_file('./sample_reviews.txt')
    assert_equal "EMPLOYEE REVEIW-\nname- Mike Jones\nReview- Mike jones is a swell guy who works hard. He has a solid work ethic that gets the job done.\nHe has no problem doing the job that needs to get done. He goes above and beyond daily.\nSometimes he comes in 5 minutes late, but it doesn't seem to slow anything down.\nHe stays later if things are not where they should be. I admire his dedication.\n\nname- John Dough\nReview- John Dough is a lazy guy who does the bare minimum. He has a tendency to sleep during meetings.\nIt is rare that his breath is pleasant. Sometimes he comes in early to use the showers in the gym.\nIf John worked harder, maybe he would be able to solidify a future here. I feel his work unsatisfactory.\nHe should work from home.\n\nname- Cathy Talker\nReview- Cathy is a good person to have around. She works hard and tries her best to set a good example.\nShe comes to work on time and never cries when she has to stay later. She shares her food at lunch.\nCathy could use some work in the graphics design area. Her graphics are not good, nor modern.\nI wish she studied more typography.\n\nname- Susan McMooth\nReview- Susan cries at the office very frequently. She often leaves meetings early to cry.\nSometimes when watching Disney movies, she even gets angry and loud. She is not passionate about work.\nI love the fact that she comes in early though, she always has to leave on time for those pesky children.\nI find her unsatisfactory overall, but her attitude is nice. She doesn't do a good job with her marketing.\n", employee4.review_file
  end
  # assert_equal "John Dough is a great guy!", employee1.review


end
