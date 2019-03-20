def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end
def print(students)
  students.each {|s| puts "#{s[:name]} (#{s[:cohort]} cohort)" }
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #create an empty array here
  students = []
  #then gets first name
  name = gets.chomp
  #while name is not empty, repeat code
  while !name.empty? do
    students << {name: name, cohort: :july}
    puts "Now we have #{students.count} students"
    #gets another name
    name = gets.chomp
  end
  #return array
  students
end
#must call methods
students = input_students
print_header
print(students)
print_footer(students)
