require './parser'
require './console'
require './sorter'

file = File.open("webserver.log", 'r') 
lines = file.readlines.map(&:chomp)
page_views = Parser.new.parse(lines)
puts "page views count"
total_count = page_views.group_by(&:path).transform_values(&:count)    
Console.print(Sorter.sort(total_count), "total count")
puts "--------------------------------------------------------"
puts "unique page"
total_uniq_count = page_views.group_by(&:path).transform_values {|page_views|  page_views.uniq(&:ip).count}
Console.print(Sorter.sort(total_uniq_count), "total unique count")
#Problem solved now
#Now optimize and change into class baesd
#1. Need a Parser to parse the file
#2. Count class to count the page: 1. Counter(total count), 1,a: CounterUnique < Counter
#3. Sorting
#4. Print class to print the output  