class Exit
  def initialize(state)
    @state = state
  end

  def exit_app
    @state[:keep_going] = false
    p 'Thank you for using this app!'
  end
end
