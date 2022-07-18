class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unkown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
