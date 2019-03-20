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
#then print
puts "The students of Villains Academy"
puts "------------------"
students.each {|s| puts s}
#then print total number of students
puts "Overall, we have #{students.count} great students"
