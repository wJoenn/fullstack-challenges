# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.

class Record
  attr_reader :id

  def initialize(args = {})
    args.each do |k, v|
      instance_variable_set(:"@#{k}", v)
      self.class.send(:attr_accessor, k) unless k == "id"
    end
  end

  def self.table
    "#{send(:to_s).downcase}s"
  end

  def self.all
    DB.results_as_hash = true
    data = DB.execute("SELECT id FROM #{table}").map { find(_1["id"]) }
  end

  def self.find(id)
    DB.results_as_hash = true
    data = DB.execute("SELECT * FROM #{table} WHERE id = ?", id).first
    new(data) if data
  end

  def save
    instance_variables.each do |e|
      value = e.to_s.gsub('@', '')
      DB.execute("UPDATE #{self.class.table} SET #{value} = ?", instance_variable_get(e)) if @id
      unless @id
        DB.execute("INSERT INTO #{self.class.table} (#{value}) VALUES (?)", instance_variable_get(e))
        instance_variable_set(:@id, DB.last_insert_row_id)
      end
    end
  end

  def destroy
    DB.execute("DELETE from #{self.class.table} WHERE id = ?", @id)
  end
end
