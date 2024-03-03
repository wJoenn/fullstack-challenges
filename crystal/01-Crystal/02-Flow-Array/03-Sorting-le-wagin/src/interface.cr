require "./wagon_sort"

def students : Array(String)
  student_list = [] of String

  puts "Type a student name:"
  loop do
    student = gets.try &.strip

    if student.nil? || student == ""
      if student_list.empty?
        puts "You need to enter at least one student"
        next
      end

      break
    end

    student_list.push(student)
    puts "Type another student name or press enter to finish"
  end

  student_list
end

sorted_students = wagon_sort(students)

puts "Congratulations! Your Wagon has #{sorted_students.size} students:"
puts "#{sorted_students[0...-1].join(", ")}#{" and " if sorted_students.size > 1}#{sorted_students[-1]}"
