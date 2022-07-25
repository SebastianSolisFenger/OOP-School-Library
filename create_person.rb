class CreatePerson
  def initialize(state)
    @people_list = state[:people_list]
  end

  def ask_person_details
    print 'Do you want to create a student (1)  or a teacher (2)? [Input the number]: '
    user_choice = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if user_choice.to_i == 1
      print 'Has parent permission? [Y/N]: '
      permission_input = gets.chomp.downcase
    else
      print 'Specialization: '
      specialization = gets.chomp
    end
    { user_choice: user_choice, age: age, name: name, permission_input: permission_input,
      specialization: specialization }
  end

  def create_person
    person_details = ask_person_details
    case person_details[:user_choice].to_i
    when 1 then create_student(person_details[:age], person_details[:name], person_details[:permission_input])
    when 2 then create_teacher(person_details[:specialization], person_details[:age], person_details[:name])
    else p 'Please enter either 1 or 2'
    end
  end

  def create_student(age, name, permission_input)
    permission = permission_input == 'y'
    @people_list << Student.new(age, name, parent_permission: permission)
    p 'Student created successfully'
    puts ''
  end

  def create_teacher(specialization, age, name)
    @people_list << Teacher.new(specialization, age, name)
    p 'Teacher created successfully'
    puts ''
  end
end
