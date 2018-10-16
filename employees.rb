class Employee
  attr_accessor:full_name
  attr_accessor:id

  def initialize(full_name, id)
    @full_name = full_name
    @id = id
  end

  def surname
    @full_name.split(' ', 2).last
  end
end

class Programmer < Employee
  attr_accessor:languages

  def initialize(full_name, id, languages)
    super(full_name, id)
    @languages = languages
  end
end

class OfficeManager < Employee
  attr_accessor:office

  def initialize(full_name, id, office)
    super(full_name, id)
    @office = office
  end
end




def add_employee(employees)
  puts '[Add an employee]'
  print 'Full name: '
  full_name = gets.chomp
  print 'ID: '
  id = gets.chomp
  print "Is the person [e]mployee, [p]rogrammer or an [o]ffice menager? "
  role = gets.chomp.downcase
  case role
  when role='e' then
    employees<<Employee.new(full_name, id)
  when role='o' then
    print "Office: "
    employees<<OfficeManager.new(full_name, id, gets.chomp)
  when role='p'
    print "Programming languages: "
    employees<<Programmer.new(full_name, id, gets.chomp)
  else
    puts "Wrong input"
    return
  end
end

def view_employees(employees)
  print "Sort by [f]isrt name or [l]ast name: "
  sort=gets.chomp
  
  case sort
    when 'l' then 
      sorted_employees_l(employees).each do |employee|
        print "#{employee.full_name}, #{employee.id}"
        case employee
        when OfficeManager then print " (#{employee.office})\n"
        when Programmer then print " [#{employee.languages}]\n"
        else
          print "\n"
        end
      end
    when 'f' then 
      sorted_employees_f(employees).each do |employee|
        print "#{employee.full_name}, #{employee.id}"
        case employee
        when OfficeManager then print " (#{employee.office})\n"
        when Programmer then print " [#{employee.languages}]\n"
        else
          print "\n"
        end
      end
    else
      puts "Wrong input"
      return
    end
end


def edit_employees(employees)
  puts '[Edit an employee]'
  print 'ID of employee you want to edit: '
  id = gets.chomp
  target=nil

  employees.each do |employee|
    if employee.id == id
      target=employee
      break
    end
  end
  
  puts "Curent full name: #{target.full_name}"
  print "New full name: "
  target.full_name= gets.chomp
  puts "Current ID: #{target.id}"
   print "New ID: "
  target.id= gets.chomp

end

def sorted_employees_l(employees)
  employees.sort_by do |employee|
    employee.full_name.split(' ', 2).last.downcase
  end
end

def sorted_employees_f(employees)
  employees.sort_by do |employee|
    employee.full_name.split(' ', 2).first.downcase
  end
end

def quit
  puts 'Goodbye!'
  exit
end

def print_help
  puts '[HELP]'
  puts 'Enter one of the following:'
  puts 'a - to add a new employee'
  puts 'v - to view existing employees'
  puts 'e - to edit existing employees'
  puts 'q - to quit the program'
end

def get_action
   gets.downcase[0]
end

puts 'Employee-o-matic 4000'

employees = []

loop do
  print 'What do you want to do? '
  action = get_action

  case action
  when 'a' then add_employee(employees)
  when 'v' then view_employees(employees)
  when 'e' then edit_employees(employees)
  when 'q' then quit
  else
    print_help
  end
end