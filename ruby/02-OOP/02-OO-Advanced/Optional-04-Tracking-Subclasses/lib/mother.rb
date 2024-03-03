class Mother
  CHILDREN = []
  def self.inherited(sub_class)
    CHILDREN.push(sub_class)
  end

  def self.phone_kids
    CHILDREN.each { |e| e.phone }
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
