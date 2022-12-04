#!/usr/bin/ruby

# number of section assignment pairs that fully contain the other
def part1(input)
    num = 0 # number of pairs that fully contain the other

    input.each_line do |line|
        # split line into two pairs of assignments
        pair = line.chomp.split ","

        # split pair into both assignments
        assignments1, assignments2 = pair

        # split both assignments to get the first and last sections
        assignments1 = assignments1.split "-"
        assignments2 = assignments2.split "-"

        # get sections as an array
        sections1 = (assignments1[0]..assignments1[1]).to_a
        sections2 = (assignments2[0]..assignments2[1]).to_a

        # if one assignment fully contained the other assignment
        if ((sections1.intersection sections2) == sections2) ||
            ((sections2.intersection sections1) == sections1)
            num += 1
        end
    end

    num
end

# number of section assignment pairs that overlap the other
def part2(input)
    num = 0 # number of pairs that overlap the other

    input.each_line do |line|
        # split line into two pairs of assignments
        pair = line.chomp.split ","

        # split pair into both assignments
        assignments1, assignments2 = pair

        # split both assignments to get the first and last sections
        assignments1 = assignments1.split "-"
        assignments2 = assignments2.split "-"

        # get sections as an array
        sections1 = (assignments1[0]..assignments1[1]).to_a
        sections2 = (assignments2[0]..assignments2[1]).to_a

        # if one assignment overlaps the other assignment
        if (sections1.intersect? sections2)
            num += 1
        end
    end

    num
end

if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end