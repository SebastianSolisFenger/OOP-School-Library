require_relative './corrector'
require_relative './rental'
require 'securerandom'

class Person
  attr_accessor :name, :age, :parent_permission, :id
  attr_reader :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @name_corrector = Corrector.new
    @rentals = []
    @id = SecureRandom.uuid.slice(0..3)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def validate_name(_name)
    @name = @name_corrector.correct_name(@name)
  end

  private

  def of_age?
    return true unless @age < 18

    false
  end
end
