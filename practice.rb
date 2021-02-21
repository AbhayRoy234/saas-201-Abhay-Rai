=begin
nums = [1, 2, 3, 4, 5, 6]
# avg = (nums.sum.to_f / nums.length)
# puts "The average of these numbers are #{avg.to_f}"
=end

# //

=begin

puts "Fiction or non-fiction?"
genre = gets.chomp.downcase

if genre == "fiction"
  puts "Try reading Cryptonomicon by Neal Stephenson"
elsif genre == "non-fiction"
  puts "You should read The Ascent of Man by Jacob Bronowski!"
else
  puts "Oh I don't know about that genre"
end

=end

#//
=begin
h = {}
author = ["Design as Art", "Anathem", "Shogun"]
book = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
book.each_with_index { |item, index|
  h.store(item.downcase.to_sym, author[index].split)
}

h.each do |aut, se|
  puts "  #{aut}  => #{se}"
end

=end

=begin
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]

h = {}
names.collect do |item|
  # item.each do |stu|
  puts item.join(" ")
  # end
end



=end
# puts item[0]
=begin
h.each do |aut, se|
  puts "  #{aut}  => #{se}"
end
=end

=begin
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
new_arr = []
n=0
todos.each do |val|
  if n/2!=0
    new_arr = todos.map {|number| number }
    n=n+1
end

=end

=begin
todos = [
  ["Nelson Rolihlahla Mandela", "hello"],
  ["Sir Alan Turing", "welcome"],
]

def salute(todos)
  todos.each do |arr|
    puts " #{arr[1]} Mr. #{arr[0].split(" ").last} "
  end
end

salute(todos)

=end

node1 = {
  :tag => "h1",
  :text => "Ruby was made to make Programers Life Easy",
}
node2 = {
  :tag => "div",
  :children => [
    {
      :tag => "h2",
      :text => "The Ruby Language",
    },
    {
      :tag => "p",
      :text => "Ruby is built For Programers Happines",
    },
  ],
}

html = {
  :tag => "div",
  :children => [node1, node2],
}

def rendre(node)
  if node[:tag] == "p"
    # puts "p :"
    puts node[:text]
  elsif node[:tag] == "h1"
    puts "*****   #{node[:text].upcase}   ***** "
  elsif node[:tag] == "h2"
    puts "**   #{node[:text].upcase}   ** "
  elsif node[:tag] == "div"
    children = node[:children]
    children.each { |child| rendre(child) }
  end
end

rendre(html)
