#!/usr/bin/ruby

# find the most calories
def part1(input)
    i = 0 # current elf
    elves = Array.new(1, 0) # total calories of each elf

    input.each_line do |line|
        # if line is empty, move to next elf
        if line == "\n"
            i += 1 # go to next elf
            elves[i] = 0 # initalize elf calories
        else
            # add line to total of this elf's calories
            elves[i] += line.to_i
        end
    end
    
    # return the most calories of one elf
    elves.max
end

# find the top three most calories
def part2(input)
    i = 0 # current elf
    elves = Array.new(1, 0) # total calories of each elf

    input.each_line do |line|
        # if line is empty, move to next elf
        if line == "\n"
            i += 1 # go to next elf
            elves[i] = 0 # initalize elf calories
        else
            # add line to total of this elf's calories
            elves[i] += line.to_i
        end
    end
    
    # three elves with the most amount of calories
    top_three = Array.new

    # get top three elves
    for elf in 1..3
        top_three.append elves.max # add top elf to the top three
        elves.delete elves.max # remove elf from array of elves
    end

    # return the sum of the top three
    top_three.sum
end

if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end