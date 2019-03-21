@students = []

def print_header
  puts "##########################################".center(75)
  puts "#    The Students of Villains Academy    #".center(75)
  puts "##########################################".center(75)
end

def print_student_list
  return @students.each_with_index do |s,i|
    puts "#{i+1}. #{s[:name]} - Height: #{s[:height]}cm, Weight: #{s[:weight]}kg, Birthplace: #{s[:pob]}, Skill: #{s[:skill]} (#{s[:cohort]} cohort)".center(75)
  end
end

def print_footer
  puts ""
  if @students.count < 2
    puts "Overall, we have #{@students.count} great student".center(75)
  else
    puts "Overall, we have #{@students.count} great students".center(75)
  end
end

def input_students
  puts "Please add the student's name"
  puts "To finish, hit return twice"
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
    @students << {name: name, cohort: cohort, height: height, weight: weight, pob: pob, skill: skill}
    if @students.count < 2
      puts "Now we have 1 student"
    elsif @students.count > 1
      puts "Now we have #{@students.count} students"
    end
    puts "Please add the next student's name"
    name = gets.chomp.gsub(/\w+/, &:capitalize)

    end
  @students
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [ student[:name], student[:cohort] ]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
