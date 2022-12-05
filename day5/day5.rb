#!/usr/bin/ruby

# move crates from one stack to another based on commands
def part1(input)
    # split into original stack layout and commands
    stack_layout, commands = input.split "\n\n"

    stacks = [] # array of stacks

    stack_layout = stack_layout.lines.reverse # get stacks from bottom to top
    stack_layout.shift # remove numbers at bottom

    numOfStacks = stack_layout[0].split(" ").length # get number of stacks

    # fill array of stacks with empty stacks
    numOfStacks.times { stacks.append [] }

    # seperate into different stacks
    stack_layout.each do |line|
        #numOfStacks.times do |i|
        stacks.each_with_index do |stack, i|
            # if not the first crate, drop 4
            if i != 0
                line = line.chars.drop(4).join
            end

            # add crate to stack
            stack.append line.chars.take(3).join
        end
    end

    # change "[A]" to "A"
    stacks.each do |stack|
        stack.each_with_index do |crate, i|
            # seperate "A" from "[A]"
            stack[i] = crate[1]
        end

        # remove all empty spaces in stack
        stack.reject! { |crate| crate.strip.empty? == true}
    end

    commands.each_line do |line|
        line = line.split " "

        number = line[1].to_i # number of crate to move
        start = line[3].to_i - 1 # starting stack
        dest = line[5].to_i - 1 # end stack
        
        popped = stacks[start].pop number # pop number of crates from starting stack
        stacks[dest].concat popped.reverse # add popped crates to destination
    end

    top = [] # array of the crates at the top of each stack

    stacks.each do |stack|
        # pop from top of stack and add to array
        top.push stack.pop
    end

    top.join # join array into one string
end

# move crates from one stack to another based on commands, retain order
# the only difference from part 1 is removing .reverse from popped on line 113
def part2(input)
    # split into original stack layout and commands
    stack_layout, commands = input.split "\n\n"

    stacks = [] # array of stacks

    stack_layout = stack_layout.lines.reverse # get stacks from bottom to top
    stack_layout.shift # remove numbers at bottom

    numOfStacks = stack_layout[0].split(" ").length # get number of stacks

    # fill array of stacks with empty stacks
    numOfStacks.times { stacks.append [] }

    # seperate into different stacks
    stack_layout.each do |line|
        #numOfStacks.times do |i|
        stacks.each_with_index do |stack, i|
            # if not the first crate, drop 4
            if i != 0
                line = line.chars.drop(4).join
            end

            # add crate to stack
            stack.append line.chars.take(3).join
        end
    end

    # change "[A]" to "A"
    stacks.each do |stack|
        stack.each_with_index do |crate, i|
            # seperate "A" from "[A]"
            stack[i] = crate[1]
        end

        # remove all empty spaces in stack
        stack.reject! { |crate| crate.strip.empty? == true}
    end

    commands.each_line do |line|
        line = line.split " "

        number = line[1].to_i # number of crate to move
        start = line[3].to_i - 1 # starting stack
        dest = line[5].to_i - 1 # end stack
        
        popped = stacks[start].pop number # pop number of crates from starting stack
        stacks[dest].concat popped # add popped crates to destination
    end

    top = [] # array of the crates at the top of each stack

    stacks.each do |stack|
        # pop from top of stack and add to array
        top.push stack.pop
    end

    top.join # join array into one string
end


if __FILE__ == $0
    file = File.open(ARGV[0]).read

    puts "Part 1: #{part1 file}"

    puts "Part 2: #{part2 file}"
end