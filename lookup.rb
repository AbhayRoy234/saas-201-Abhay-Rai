def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

# ..
# ..
# FILL YOUR CODE HERE
d = {}
dns_raw = File.readlines("zone")
dns_raw.each do |values|
  a = values.split(",")
  if a[0] == "A"
    d[a[1].strip] = ["A"]
    d[a[1].strip].push(a[2].strip)
  elsif a[0] == "CNAME"
    d[a[1].strip] = ["CNAME"]
    d[a[1].strip].push(a[2].strip)
  end
end
puts d
lookup_chain = [domain]

def resolve(d, lookup_chain, domain)
  if d[domain][0] == "A"
    return lookup_chain.push(d[domain][1])
  else
    lookup_chain.push(domain)
    resolve(d, lookup_chain, d[domain][1])
  end
end

puts resolve(d, lookup_chain, domain)
# def resolve(dns_records,lookup_chain,domain)
# lookup_chain.push(dns_records[doma])
# ..
# ..

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
# dns_records = parse_dns(dns_raw)
# lookup_chain = [domain]
# lookup_chain = resolve(dns_records, lookup_chain, domain)
# puts lookup_chain.join(" => ")
