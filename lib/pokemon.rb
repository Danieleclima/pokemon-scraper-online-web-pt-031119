require 'pry'

class Pokemon
  
  attr_accessor :name, :type, :db 
  attr_reader :id 
  
  def initialize (name:, type:, db:, id:)
    @name = name
    @type = type
    @id = id
  end
  
def self.save (name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find (id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    
    result = db.execute(sql,id)[0]
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: db)
  end
  
end
