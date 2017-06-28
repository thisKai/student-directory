def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students, letter = nil)
  printed_students = if letter && !letter.empty?
    students.select { |s| s[:name][0].downcase == letter.downcase }
  else
    students
  end
  printed_students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_initial
  puts 'Find a student by their first initial'
  gets.chomp
end

students = input_students
#nothing happens until we call the methods
print_header
print(students, input_initial)
print_footer(students)
