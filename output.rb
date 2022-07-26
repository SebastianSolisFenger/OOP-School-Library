require 'fileutils'
require 'json'

class Output
  def initialize(path)
    @path = path
  end

  def create_files
    FileUtils.mkdir_p(@path)
    FileUtiles.touch("#{@path}/books.json") unless File.exist?("#{@path}/books.json")
    FileUtiles.touch("#{@path}/people.json") unless File.exist?("#{@path}/people.json")
    FileUtiles.touch("#{@path}/rentals.json") unless File.exist?("#{@path}/rentals.json")
  end

  def save_books(state)
    books_hash = state[:books_list].map { |book| { title: book.title, author: book.author } }
    books_json = JSON.generate(books_hash)
    File.write("#{@path}/books.json", books_json)
    #  File.open("#{@path}/books.json", 'w') { |f| f.write books_json }
  end
end

# 1. Creates the directory @path if it doesn't exist.
# 2. Creates the file books.json if it doesn't exist.
# 3. Creates the file people.json if it doesn't exist.
# 4. Creates the file rentals.json if it doesn't exist.
# 1. It creates a hash of books with the title and author of each book.
# 2. It converts the hash to JSON.
# 3. It writes the JSON to a file called books.json
