class Customer
  attr_accessor :address, :id, :name

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @address = args[:address]
  end
end
