class Employee
    attr_reader :salary, :name, :title, :boss
    attr_writer :boss

    def initialize(name, title, salary)
        @name = name
        @title = title
        @salary = salary
        @boss = nil
        @employees = []
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    def collect_employee_salaries
        salaries = []
        @employees.each do |employee|
            salaries << employee.salary
            salaries += employee.collect_employee_salaries
        end
        
        salaries
    end
end