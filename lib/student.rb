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
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS students(id INTEGER PRIMARY KEY,name TEXT,grade TEXT) ")
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students")
  end

  def save
    if(self.id)
      self.upddate
    else
      sql=<<-SQL
        INSERT INTO students(name,grade)
        VALUES(?,?)
      SQL

      DB[:conn].execute(sql,self.name,self.grade)
      @id=DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end

  end

  def update
    sql="UPDATE students SET name=?,grade=? WHERE id=?"
    DB[:conn].execute(sql,self.name,self.grade,self.id)
  end

end
