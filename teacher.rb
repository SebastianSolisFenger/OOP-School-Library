require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, _age, _name = 'Unknown', _parent_permission: true)
    super()
    @specialization = specialization
  end

  def can_use_servicies?
    true
  end
end
