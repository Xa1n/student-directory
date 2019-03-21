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
  name = STDIN.gets.chomp.gsub(/\w+/, &:capitalize)
  while !name.empty? do
    puts "Enter their height in cm"
    height = STDIN.gets.chomp.to_i
    puts "Enter their weight in kg"
    weight = STDIN.gets.chomp.to_i
    puts "What's their place of birth?"
    pob = STDIN.gets.chomp.gsub(/\w+/, &:capitalize)
    puts "What's their best skill?"
    skill = STDIN.gets.chomp.capitalize
    puts "What cohort are they in?"
    cohort = STDIN.gets.chomp.capitalize
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
    name = STDIN.gets.chomp.gsub(/\w+/, &:capitalize)

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
    when "4"
      load_students
    when "5"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "5. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
