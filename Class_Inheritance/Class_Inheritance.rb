class Employee

    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name 
        @title = title
        @salary = salary 
        @boss = boss 
    end 

    def bonus(multiplier) 
        bonus = @salary * multiplier 
    end 
end 

class Manager < Employee 
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end 

    def bonus(multiplier) 
        bonus = self.salary_underneath * multiplier 
    end 

    def salary_underneath
        total = 0 
        employees.each do |emp_name| 
            if emp_name.is_a?(Manager) 
                total += emp_name.salary_underneath 
                total += emp_name.salary 
            else 
                total += emp_name.salary 
            end 
        end 
        total
    end 
end 

shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78_000, "Ned")
darren.employees = [shawna, david]
ned.employees = [darren]

ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000