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
  if students.count < 2
    puts "Overall, we have #{students.count} great student".center(75)
  else
    puts "Overall, we have #{students.count} great students".center(75)
  end
end

def input_students
  puts "Please add the student's name"
  puts "To finish, hit return twice"

  students = []
  name = gets.chomp.gsub(/\w+/, &:capitalize)
  while !name.empty? do
    puts "Enter their height in cm"
    height = gets.chomp.to_i
    puts "Enter their weight in kg"
    weight = gets.chomp.to_i
    puts "What's their place of birth?"
    pob = gets.chomp.gsub(/\w+/, &:capitalize)
    puts "What's their best skill?"
    skill = gets.chomp.capitalize
    puts "What cohort are they in?"
    cohort = gets.chomp.capitalize
      if cohort.length == 0
        cohort = "Undecided"
      end
    students << {name: name, cohort: cohort, height: height, weight: weight, pob: pob, skill: skill}
    if students.count < 2
      puts "Now we have 1 student"
    elsif students.count > 1
      puts "Now we have #{students.count} students"
    end
    puts "Please add the next student's name"
    name = gets.chomp.gsub(/\w+/, &:capitalize)

    end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
