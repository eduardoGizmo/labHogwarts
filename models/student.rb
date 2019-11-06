require_relative('../db/sql_runner.rb')


class Student

attr_reader :id, :first_name, :last_name, :age, :house_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @first_name = options['first_name']
  @last_name = options['last_name']
  @age = options['age'].to_i
  @house_id = options['house_id'].to_i
end

def save()
  sql = "INSERT INTO students (first_name, last_name, age, house_id)
  VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @last_name, @age, @house_id]
    student = SqlRunner.run(sql, values)
    @id = student.first()['id'].to_i
end

def delete()
  sql = "SELECT * FROM students WHERE id = $1"
  value = [@id]
  SqlRunner.run(sql, value)
end


def house()
  sql = "SELECT houses.* FROM houses INNER JOIN students ON houses.id = $1"
  value = [@id]
  student = SqlRunner.run(sql, value)
  return House.map_item(student)
end

def self.find_by_id(id)
  sql = "SELECT * FROM students WHERE id = $1"
  values = [id]
  student = SqlRunner.run(sql, values)
  result = Student.new(student.first)
  return result
end

def self.all()
  sql = "SELECT * FROM students"
  students = SqlRunner.run(sql)
  result = students.map { |student| Student.new(student)}
  return result
end

def self.map_item(student)
  student.each { |item| Student.new(item)}
end

end
