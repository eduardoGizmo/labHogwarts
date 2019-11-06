require_relative('../models/house.rb')
require_relative('../models/student.rb')


require('pry-byebug')


house1 = House.new({"name" => "Gryffindor", "logo" => "../public/images/gryffindor.jpg" })
house1.save()
house2 = House.new({"name" => "Hufflepuff", "logo" => "../public/images/hufflepuff.jpg" })
house2.save()
house3 = House.new({"name" => "Ravenclaw", "logo" => "../public/images/ravenclaw.jpg" })
house3.save()
house4 = House.new({"name" => "Slytherin", "logo" => "../public/images/slytherin.jpg" })
house4.save()

student1 = Student.new (
{"first_name" => "Harry","last_name" => "Potter", "age" => 10, "house_id" => house1.id })
student1.save()
student2 = Student.new(
{ "first_name" => "Luna", "last_name" => "Lovegood", "age" => 12, "house_id" => house2.id})
student2.save()
student3 = Student.new(
{ "first_name" => "Neville", "last_name" => "Longbottom", "age" => 11, "house_id" => house3.id})
student3.save()
student4 = Student.new(
{ "first_name" => "Oliver", "last_name" => "Wood","age" => 13, "house_id" => house4.id})
student4.save()

binding.pry
nil
