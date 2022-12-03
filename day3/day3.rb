#!/usr/bin/ruby

# get sum of all item priorities of item in both compartments
def part1(input)
    sum = 0 # total sum of item priorities
    
    input.each_line do |line|
        len = line.length / 2 # length of one compartment

        # seperate into two arrays of characters
        compartment1 = line[0..len-1].chars
        compartment2 = line[len..line.length-1].chars

        duplicate = "" # item in both compartments

        # get item thats in both compartments
        compartment1.each do |c|
            # if item is also in compartment 2
            if compartment2.include? c
                duplicate = c
                break
            end
        end

        # offset to get 1..26 if "a".."z", get 27..52 if "A".."Z"
        offset = (duplicate in "a".."z") ? 96 : 38
        
        # get item priority
        duplicate = duplicate.ord - offset

        # add item priority to sum
        sum += duplicate
    end

    sum
end

# get sum of item priorities of item in each group of 3
def part2(input)
    sum = 0 # total sum of item priorities
    
    i = 0 # number of elves
    rucksacks = [] # the rucksacks of the elves in a group of 3

    input.each_line do |line|
        i += 1

        # add elf's rucksack to group
        rucksacks.push line

        # if this elf is the last in the group
        if i % 3 == 0
            bag1, bag2, bag3 = rucksacks

            duplicate = "" # item in all rucksacks

            # get item thats in all rucksacks
            bag1.chars.each do |c|
                # if item is also in other 2 rucksacks
                if (bag2.include? c) && (bag3.include? c)
                    duplicate = c
                    break
                end
            end

            # offset to get 1..26 if "a".."z", get 27..52 if "A".."Z"
            offset = (duplicate in "a".."z") ? 96 : 38
            
            # get item priority
            duplicate = duplicate.ord - offset

            # add item priority to sum
            sum += duplicate

            rucksacks.clear # clear rucksacks for next group
        end
    end

    sum
end

if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end