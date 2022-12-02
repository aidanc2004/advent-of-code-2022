#!/usr/bin/ruby

def part1(input)
    score = 0 # total score

    # get shapes as numbers
    shapes = {
        "X" => 1, # rock
        "Y" => 2, # paper
        "Z" => 3, # scissors

        "A" => 1, # rock
        "B" => 2, # paper
        "C" => 3  # scissors
    }
    
    input.each_line do |line|
        elf, you = line.split # get elf's shape and your shape

        your_shape = shapes[you] # shape that you chose as a number
        elfs_shape = shapes[elf] # shape the elf chose as a number

        # win
        if ((you == "X" && elf == "C") || # rock vs scissors
            (you == "Y" && elf == "A") || # paper vs rock
            (you == "Z" && elf == "B"))   # scissors vs paper
            outcome = 6
        # draw
        elsif your_shape == elfs_shape
            outcome = 3
        # lose
        else
            outcome = 0
        end

        # get score for current round and add it to total
        score += your_shape + outcome
    end

    score
end

def part2(input)
    score = 0 # total score
    
    # get shapes as numbers
    shapes = {
        "X" => 1, # rock
        "Y" => 2, # paper
        "Z" => 3, # scissors

        "A" => 1, # rock
        "B" => 2, # paper
        "C" => 3  # scissors
    }

    # what you will lose against
    losing_shape = {
        "A" => "Z", # rock vs scissors
        "B" => "X", # paper vs rock
        "C" => "Y"  # scissors vs paper
    }

    # what you will win against
    winning_shape = {
        "A" => "Y", # rock vs paper
        "B" => "Z", # paper vs scissors
        "C" => "X"  # scissors vs rock
    }

    input.each_line do |line|
        elf, you = line.split # get elf's shape and how the round will end

        elfs_shape = shapes[elf] # shape the elf chose as a number

        # lose
        if you == "X"
            shape = losing_shape[elf] # shape you would have chose
            your_shape = shapes[shape] # shape you chose as a number
            outcome = 0
        # draw
        elsif you == "Y"
            your_shape = elfs_shape
            outcome = 3
        # win
        else
            shape = winning_shape[elf] # shape you would have chose
            your_shape = shapes[shape] # shape you chose as a number
            outcome = 6
        end

        # get score for current round and add it to total
        score += your_shape + outcome
    end

    score
end

if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end