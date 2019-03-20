#group students into array
students = [
{name: "Darth Vader", cohort: :july},
{name: "Fire Lord Ozai", cohort: :july},
{name: "The Joker", cohort: :july},
{name: "All For One", cohort: :july},
{name: "Ganon", cohort: :july},
{name: "M. Bison", cohort: :july},
{name: "Psycho Mantis", cohort: :july},
{name: "Joffrey Baratheon", cohort: :july},
{name: "Blackbeard", cohort: :july},
{name: "Thanos", cohort: :july},
{name: "Gary", cohort: :july}
]
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
#must call methods
print_header
print(students)
print_footer(students)
