require_relative('../db/sql_runner.rb')

class House

attr_reader :id, :name, :logo

def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
end


def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    house = SqlRunner.run(sql, values)
    @id = house.first()['id'].to_i
end


def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)
    result = House.new(house.first)
    return result
end


def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map { |house| House.new(house)}
    return result
end

def self.map_item(house)
  house.each { |item| House.new(item)}
end

end
