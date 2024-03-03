# TODO: you can build your christmas list program here!
require "open-uri"
require "nokogiri"
require "csv"

puts "Welcome to your Christmas gift list"

list = []

def list_items(list)
  puts "Your list is empty." if list.length.zero?
  if list.length >= 1
    list.each_with_index do |e, i|
      e[1] ? mark = "x" : mark = " "
      puts "#{i + 1} - [#{mark}] #{e[0]}"
    end
  end
end

def add
  puts "What do you want to add to your list ?"
  print "> "
  [gets.chomp, false]
end

def delete
  puts "Which item do you want to delete from your list ? [index]"
  print "> "
  gets.chomp.to_i - 1
end

def mark
  puts "Which item have you bought ? [index]"
  print "> "
  gets.chomp.to_i - 1
end

def etsy(word)
  puts "Here are Etsy's results for \"#{word}\""
  html = URI.open("https://www.etsy.com/search?q=#{word.downcase}").read
  data = Nokogiri::HTML(html)

  data.search(".wt-grid .v2-listing-card__title").first(5)
end

def idea
  puts "What are you looking for on Etsy ?"
  print "> "
  array = etsy(gets.chomp)
  array.each_with_index { |e, i| puts "#{i + 1} - #{e.text.strip}" }
  puts "Pick one to add to your list. [index]"
  print "> "
  array[gets.chomp.to_i - 1].text.strip
end


loop do
  puts "Which action [list|add|delete|mark|idea|quit] ?"
  print "> "
  input = gets.chomp

  case input
  when "quit" then break
  when "list"
    list_items(list)
  when "add"
    list.push(add)
  when "delete"
    list.delete_at(delete)
  when "mark"
    list[mark][1] = true
  when "idea"
    list_idea = idea
    list.push([list_idea, false])
    puts "\"#{list_idea}\" added to your list."
  else puts "Command not recognised, try again."
  end
end

CSV.open("./lib/wishlist.csv", "wb") do |csv|
  csv << ["name", "bought"]
  list.each { |e| csv << e }
end
