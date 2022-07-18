require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unkown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_servicies
    if of_age || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
