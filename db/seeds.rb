# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

5.times do
  u = User.new

  u.first_name = Faker::Name.first_name
  u.last_name = Faker::Name.last_name
  u.email = Faker::Internet.email(u.first_name)
  u.password = '12341234'
  u.telephone = Faker::PhoneNumber.phone_number
  u.save
end

# Add me as user
  u = User.new
  u.first_name = "James"
  u.last_name = "Woodworth"
  u.email = "jgwoodworth@gmail.com"
  u.password = "jimmer13"
  u.telephone = "224.345.9494"
  u.save

puts "There are #{User.count} users in the database"


Course.destroy_all

course_info = [
  {
    :course_number => "IT 134",
    :course_name =>"Introduction to Programming Concepts",
    :course_department =>"Inforamtion Technology",
    :course_description =>"This course introduces students to programming logic constructs used in structured programming. Problem solving and structure types (sequence, decision, and repetition) will be presented. Other programming concepts presented in this course include: numeric and string variables, data input and output techniques, functions and procedures, arrays, and processing sequential files. "
  },
  {
    :course_number => "IT 137",
    :course_name =>"Object Oriented Programming using Java",
    :course_department =>"Inforamtion Technology",
    :course_description =>"Encapsulation, inheritance and polymorphism, as implemented in the unique Java way, will be an important basis for study. Students will write Java programs for business applications and applets for the Internet. There will be special emphasis on C and C++ differences such as multithreading, graphics, multimedia, Java classes, and the larger Java environment. Basic GUI components from the Abstract Windowing Toolkit (AWT) and Java Foundation classes (Swing) will be covered."
  },
  {
    :course_number => "IT 170",
    :course_name =>"Creating Web Pages",
    :course_department =>"Inforamtion Technology",
    :course_description =>"In this course students are introduced to technical aspects of Web page creation. Topics presented in this course include: beginning through advanced concepts of programming in Web markup languages HTML and XHTML; formatting Web pages using Cascading Style Sheets (CSS); Web page interactivity using the Web browser scripting language JavaScript; adding graphics, sound, video, and Java applets into Web pages; and how data is exchanged on the Web using XML. Students will also gain the skills required to publish and maintain Web sites."
  },
  {
    :course_number => "MTH 101",
    :course_name =>"Elementary Concepts of Mathematics",
    :course_department =>"Mathematics",
    :course_description =>"Basic principles of arithmetic: fractions, decimals, ratios, proportions, percent, very basic algebra, descriptive graphs and basic statistics from a calculator based perspective."
  },
  {
    :course_number => "MTH 102",
    :course_name =>"Basic Algebra",
    :course_department =>"Mathematics",
    :course_description =>"This developmental course is the first course in the algebra sequence. Basic algebra topics include, but are not limited to: expressions, linear equations and functions with graphing, exponents, basic polynomial operations, and factoring. Modeling and problem solving will be introduced throughout the course."
  },
  {
    :course_number => "ART 121",
    :course_name =>"Introduction to Art",
    :course_department =>"Art",
    :course_description =>"This course will introduce students to an appreciation of the visual arts through an intercultural, social/historical approach. The course will also emphasize the nature of the creative process, integrating a study of the conceptual principles, with methods and materials which influence artistic critical thinking, problem solving, exploration, and discovery."
  },
  {
    :course_number => "ART 123",
    :course_name =>"Color and Design Techniques",
    :course_department =>"Art",
    :course_description =>"This studio course is a continuation of ART 122 that focuses on two dimensional design concepts, principles, and techniques. Use of color techniques and development will be focused on through a variety of mediums."
  }
]


course_info.each do |course_hash|
  random_num = rand(User.count)
  random_user = User.offset(random_num).first

  c = Course.new
  c.course_number = course_hash[:course_number]
  c.course_name = course_hash[:course_name]
  c.course_department = course_hash[:course_department]
  c.course_description = course_hash[:course_description]
  c.course_creator = random_user.id
  c.save
end

puts "There are now #{Course.count} courses in the database."


Enrollment.destroy_all

10.times do
  user_random_num = rand(User.count)
  random_user = User.offset(user_random_num).first

  course_random_num = rand(Course.count)
  random_course = Course.offset(course_random_num).first

  e = Enrollment.new
  e.user_id = random_user.id
  e.course_id = random_course.id
  e.save
end

puts "There are now #{Enrollment.count} enrollments in the database."


Taken.destroy_all

10.times do
  user_random_num = rand(User.count)
  random_user = User.offset(user_random_num).first

  course_random_num = rand(Course.count)
  random_course = Course.offset(course_random_num).first

  e = Taken.new
  e.user_id = random_user.id
  e.course_id = random_course.id
  e.save
end

puts "There are now #{Taken.count} completed courses in the database."





