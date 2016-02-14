Normal Mode

Part 1

You want to keep track of employees (with their names, email addresses, phone numbers, and salaries), departments (with their names), and which employees are in which department. You should be able to:

Create a new department (given its name).
estimate: (1)     - 5 mins
-complete

Create a new employee (given his/her name, email address, phone number, and salary).
estimate: (1)     -5 mins
-complete

Add an employee to a department.
estimate: (1)
-complete

Get an employee's name.
estimate:
-complete

Get an employee's salary.
estimate:
-complete

Get a department's name.
estimate:
-complete

Get a total salary for all employees in a department.
estimate: 1 hr
-complete - 4 hours

Add some employee review text (a paragraph or two) to an employee.
estimate: 1 hour - 25 minutes

Mark whether an employee is performing satisfactorily or not satisfactorily.
estimate: 25 min - 30 min

Give a raise to an individual. You decide if this makes sense in dollars or in percent.

estimate: 35 min
Give raises to a department's employees. You must pass this method a total dollar amount, and it must distribute the raise amounts reasonably to the department's employees. Only employees who are performing satisfactorily should get raises.
estimate: 1 hour

Commit your code after you complete each requirement (or more often).

At this stage, your code should:

Use keyword arguments at least once.

Finally, all of this code must be written using test-driven development. Your test suite should have at least one complete example (also known as a "pathological" example) of how the two classes can be used in the real world.

estimate 4
reality: over 5 hours


Part 2



Once your baseline app is complete, modify your method on Departments which gives out raises. It should now take a block which will specify which employees are eligible for raises. Prior to this stage, you only allowed "satisfactory" employees to get raises, but now it can be more flexible.

For instance, if a department had $5,000 to spread out to its employees in raises, but you wanted to only give raises to people who only made less than $100,000, you could call a give_raises method like this:

department.give_raises(5000) do |employee|
  employee.salary < 100000
end
At this stage, your code should:

Have a method which takes a block and calls yield.


estimate - 2 hours
reality: - 3 hours
