require_relative 'storage_manager'
require_relative 'book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

state = { book_list: [], people_list: [], rental_list: [], keep_going: true }

state[:book_list] << Book.new('TitleI', 'Author1')
state[:book_list] << Book.new('TitleII', 'Author2')
state[:book_list] << Book.new('TitleIII', 'Author3')
state[:book_list] << Book.new('TitleIV', 'Author4')
state[:book_list] << Book.new('TitleV', 'Author5')

state[:people_list] << Student.new(12, 'Name1', parent_permission: true)
state[:people_list] << Student.new(122, 'Name2', parent_permission: true)
state[:people_list] << Student.new(123, 'Name3', parent_permission: true)
state[:people_list] << Teacher.new('Spec1', 27, 'Name1')
state[:people_list] << Teacher.new('Spec2', 68, 'Name2')
state[:people_list] << Teacher.new('Spec3', 48, 'Name3')

state[:rental_list] << Rental.new('22/22/2022', Book.new('TitleV', 'Author5'),
                                  Student.new(123, 'Name3', parent_permission: true))

storage_manager = StorageManager.new

storage_manager.save_data(state)

storage_manager.fetch_data(state)

p(state[:rental_list])
