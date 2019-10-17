require_relative "./employee.rb"

class Manager < Employee
    def initialize(name, title, salary)
        super(name, title, salary)
        @employees = []
    end

    def bonus(multiplier)
        salaries = collect_employee_salaries
        salaries.inject(:+) * multiplier
    end

    def hire(employee)
        @employees << employee
        employee.boss = self
    end
end

if __FILE__ == $PROGRAM_NAME
    ned = Manager.new("Ned", "Founder", 1000000)
    darren = Manager.new("Darren", "TA Manager", 78000)
    shawna = Employee.new("Shawna", "TA", 12000)
    david = Employee.new("David", "TA", 10000)

    ned.hire(darren)
    darren.hire(shawna)
    darren.hire(david)

    puts ned.bonus(10)
end