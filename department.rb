class Department
  attr_reader :name
  attr_writer :employee_list

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

  def add_employee(employee_name)
    @employee_list << employee_name
  end

  def get_total_salary
    total_salaries = 0
    @employee_list.each do |e|
      total_salaries =+ e.salary
    end
    total_salaries
  end







end
