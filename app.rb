require_relative './book'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './execute'
require_relative './storage_manager'

class App
  attr_accessor :book_list, :people_list
  attr_reader :user_options

  def initialize
    @user_options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                     'List all rentals for a given person id', 'Exit']
    @state = { book_list: [], people_list: [], rental_list: [], keep_going: true }
    @storage_manager = StorageManager.new
  end

  def run
    @storage_manager.fetch_data(@state)
    while @state[:keep_going]
      p 'Please choose an option by entering a number:'
      @user_options.each_with_index do |option, index|
        p "#{index + 1} - #{option}"
      end
      user_choice = gets.chomp
      @exec = Execute.new(@state)
      @exec.execute(user_choice)
    end
    @storage_manager.save_data(@state)
  end
end
