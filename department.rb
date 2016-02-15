class Department
  attr_reader :name
  attr_accessor :employee_list

  def initialize(dept_name)
    @dept_name = dept_name
    @employee_list = []
  end

  def dept_name
    @dept_name
  end

  def employee_list
    @employee_list
  end

  def add_employee(employee)
    @employee_list << employee
  end

  def get_total_salary
    total_salaries = 0
    @employee_list.each do |e|
      total_salaries += e.salary
    end
    total_salaries
  end

  def give_satisfactory_raise(raise_amount)
    raise_employee_list =[]
    @employee_list.each do |e|
      raise_employee_list << e if e.satisfactory
      end
    raise_employee_list.each do |p|
      p.salary += (raise_amount / raise_employee_list.length)
    end
  end

  def give_targeted_raise(raise_amount)
    raise_employee_list = []
    @employee_list.each do |e|
      raise_employee_list << e if yield(e)
        end
    raise_employee_list.each do |p|
      p.salary += (raise_amount / raise_employee_list.length)
    end
  end



end
