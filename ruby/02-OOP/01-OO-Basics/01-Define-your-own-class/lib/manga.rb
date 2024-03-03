class Manga
  def initialize(name, status = "Plan to read")
    @name = name
    @status = status
  end

  def read
    @status = "reading"
    puts "Currently reading #{@name}"
  end
end
