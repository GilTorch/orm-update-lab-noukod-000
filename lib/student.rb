require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name,:grade
  attr_reader :id

  def initialize(name=nil,grade=nil,id=nil)
    @name=name
    @grade=grade
    @id=id
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE students IF NOT EXIST(id INTEGER PRIMARY KEY,name TEXT,grade TEXT) ")
  end

end
