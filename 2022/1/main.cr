elves = Array(Int32).new
input = File.read("./input.txt")
input.split("\n\n").each do |group|
  elves << group
    .split("\n")
    .reject { |i| i == "" }
    .map { |i| i.to_i32 }
    .sum
end

p elves.max
top_3 = elves.sort.reverse.first(3)
p top_3.sum
