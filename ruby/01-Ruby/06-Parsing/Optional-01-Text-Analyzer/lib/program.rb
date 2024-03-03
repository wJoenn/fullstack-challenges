require_relative "text_analyzer"

start = Time.new

file = File.read("./lib/harryPotter.txt")
stop = File.read("./lib/stop_words.txt")

analyze(file).each { |k, v| puts "#{k} is #{v}" }

p useful(file, stop)

p summary(file)

puts "Your program took #{(Time.new - start).round(2)}s to run"
