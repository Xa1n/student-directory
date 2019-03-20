def print_header
  puts "##########################################".center(75)
  puts "#    The Students of Villains Academy    #".center(75)
  puts "##########################################".center(75)
end
def print(students)
  return students.each_with_index do |s,i|
  puts "#{i+1}. #{s[:name]} - Height: #{s[:height]}cm, Weight: #{s[:weight]}kg, Birthplace: #{s[:pob]}, Skill: #{s[:skill]} (#{s[:cohort]} cohort)".center(75)
  end
end
def print_footer(students)
  puts ""
  puts "Overall, we have #{students.count} great students".center(75)
end

def input_students
  puts "Please add the student's name"
  puts "To finish, hit return twice"
  #create an empty array here
  students = []
  #then gets first name
  name = gets.chomp.gsub(/\w+/, &:capitalize)
  while !name.empty? do
    puts "Enter their height in cm"
    height = gets.chomp.to_i
    puts "Enter their weight in kg"
    weight = gets.chomp.to_i
    puts "What's their place of birth?"
    pob = gets.chomp
    puts "What's their best skill?"
    skill = gets.chomp.capitalize
    puts "What cohort are they in?"
    cohort = gets.chomp.capitalize
      students << {name: name, cohort: cohort, height: height, weight: weight, pob: pob, skill: skill}
    puts "Please add the next student's name"
      name = gets.chomp.gsub(/\w+/, &:capitalize)
  end
  #return array
  students
end
#must call methods
students = input_students
print_header
print(students)
print_footer(students)
