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

    puts "Which cohort does this student belong to?"
    cohort = gets.chomp

    student_word = students.count == 1 ? 'student' : 'students'
    puts "Now we have #{students.count} #{student_word}"
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

def student_str(student, index)
  index = ((index + 1).to_s + '.').center(4)
  name = student[:name].center(30)
  cohort = student[:cohort].to_s.center(10)
  "#{index} #{name} (#{cohort} cohort)"
end

def print(students, letter = nil)
  printed_students = if letter && !letter.empty?
    students.select { |s| s[:name][0].downcase == letter.downcase }
  else
    students
  end
  # printed_students.select! { |s| s[:name].length < 12 }
  index = 0
  while index < printed_students.length
    student = printed_students[index]
    puts student_str(student, index)
    index += 1
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
