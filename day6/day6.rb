#!/usr/bin/ruby

# find number of characters processed before reaching an array with 4 unique characters
def part1(input)
    input = input.chars # convert input into characters

    chars = 0 # number of characters processed

    while true
        a = input.take 4 # take first four characters

        input = input.drop 1 # remove first character for next iteration
        
        chars += 1

        # if a is equal to a without duplicates
        if a == a.uniq
            chars += a.length - 1 # add the number of characters in a 
            break
        end
    end

    chars
end

# find number of characters processed before reaching an array with 14 unique characters
def part2(input)
    input = input.chars # convert input into characters

    chars = 0 # number of characters processed

    while true
        a = input.take 14 # take first fourteen characters

        input = input.drop 1 # remove first character for next iteration
        
        chars += 1

        # if a is equal to a without duplicates
        if a == a.uniq
            chars += a.length - 1 # add the number of characters in a 
            break
        end
    end

    chars
end

if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end