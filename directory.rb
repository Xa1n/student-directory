#group students into array
students = [
"Darth Vader",
"Fire Lord Ozai",
"The Joker",
"All For One",
"Ganon",
"M. Bison",
"Psycho Mantis",
"Joffrey Baratheon",
"Blackbeard",
"Thanos",
"Gary",
]
def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end
def print(names)
  names.each {|s| puts s}
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#must call methods
print_header
print(students)
print_footer(students)
