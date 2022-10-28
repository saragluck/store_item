#This represents different types of employees
#Basic employee has a first and last name, salary, and active status
class Employee
  attr_reader :first_name, :last_name, :active
  attr_writer :active

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

#Creates instances of the employee class
employee1 = Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info

#The manager is another type of employee. We inherit the info of an employee, and used super to copy everything in the initialize method of the Employee.

class Manager < Employee
  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def send_report
    puts "Sending email..."
    # use email sending library...
    puts "Email sent!"
  end

  def give_all_raises
    @employees.each do |employee| # |employee| is basically a container that allows us to give a raise to all instances of the class.
      employee.give_annual_raise
    end
  end

  def fire_all_employees
  end
end

manager = Manager.new(first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true, employees: [employee1, employee2])

pp manager.give_all_raises

#Create a new class called intern that is an employee who can send reports.

class Intern < Employee
  def send_report
    puts "Sending email..."
    # use email sending library...
    puts "Email sent!"
  end
end

intern = Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 50000, active: true)
intern.print_info
