class Department
  attr_reader :name

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


end
