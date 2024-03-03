require_relative "animal"
require_relative "lion"
require_relative "meerkat"
require_relative "warthog"

simba = Lion.new("Simba")
timon = Meerkat.new("Timon")
# pumba = Warthog.new("Pumba")

Animal.all.each { |e| puts e.talk }
puts timon.eat("scorpion")
puts simba.eat("gazelle")
p Animal::PHYLA
p Lion::PHYLA
