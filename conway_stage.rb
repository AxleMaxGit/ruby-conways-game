# require 'rubygems'
# require 'awesome_print'

# class Cell
#   def alive_rule1(alive, neighbour_count)
#     alive && neighbour_count < 2
#   end

#   def alive_rule2(alive, neighbour_count)
#     alive && neighbour_count > 2 && neighbour_count <5
#   end

#   def alive_rule3(alive, neighbour_count)
#     alive && neighbour_count > 3
#   end

#   def alive_rule4(alive, neighbour_count)
#     !alive && neighbour_count == 3
#   end
# end

# def assert(actual, expected)
#   if actual == expected
#     print "🔵 "
#   else
#     puts
#     puts "Expected #{actual} == #{expected}"
#   end
# end

#c1 = Cell.new

#David = @suranyami

# Rule 1: Any live cell with fewer than two live neighbours dies

# puts "\n rule 1 tests"
# assert c1.alive_rule1(true, 1), true
# assert c1.alive_rule1(true, 3), false

# # Rule 2: Any live cell with two or three live neighbours lives on to the next generation
# puts "\n rule 2 tests"
# assert c1.alive_rule2(true, 1), false
# assert c1.alive_rule2(true, 3), true
# assert c1.alive_rule2(true, 5), false

# # Any live cell with more than three live neighbours dies, as if by overcrowding.
# puts "\n rule 3 tests"
# assert c1.alive_rule3(true, 1), false
# assert c1.alive_rule3(true, 4), true

# # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction
# puts "\n rule 4 tests"
# assert c1.alive_rule4(false, 3), true
# assert c1.alive_rule4(false, 2), false

#Dimensions for the game grid
WIDTH = 50
HEIGHT = 50

def rand_cell
  rand(2)
end


def starting_grid
  #Initialise the playing grid
  @start_grid = Array.new(WIDTH){Array.new(HEIGHT)}
  #Randomly generate starting state for each cell on the grid
  @start_grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      @start_grid[rindex][cindex] = rand_cell
    end
  end
end

def next_grid
  #build the next generation's grid to load values into
  @next_gen_grid = Array.new(WIDTH){Array.new(HEIGHT)}
  
  #parse each cell in the start grid to see if it lives in the next round
  @start_grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      #puts "\n\nEvaluating cell: R: #{rindex} C: #{cindex}"
      @next_gen_grid[rindex][cindex] = will_cell_survive(rindex, cindex)
    end
  end   
  #move the newly generated grid to the start grid as a sterting point for the next round
  @start_grid = @next_gen_grid
end

def show_grid(grid)
  #Display the evolving cell structures in the console
  grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      if grid[rindex][cindex] == 1
        print "️⬛️ "
      else
        print "⬜️ ️"
      end  
    end
    puts "\n"
  end
end

def count_neighbours(row, col)
  cell_count = 0
  rows = [-1, 0, 1]
  cols = [-1, 0, 1]

  rows.each do |r|
    cols.each do |c|
      #ingnore the cell being evaluated
      unless c == 0 && r == 0

      #puts "Evaluating neighbor R: #{[(row+r) % HEIGHT]} C: #{[(col+c) % WIDTH]}. State: #{@start_grid[(row+r) % HEIGHT][(col+c) % WIDTH]}" 
      #the modulus gives the grid infinite edges
      if @start_grid[(row+r) % HEIGHT][(col+c) % WIDTH] == 1
        cell_count += 1
      end
    end
  end
   end 
  #puts "Neighbour count is #{cell_count}"
  return cell_count
end

def will_cell_survive(rindex, cindex)
  count = count_neighbours(rindex, cindex)
  #If the cell being evaluated is currently alive
  if @start_grid[rindex][cindex] == 1
       #test rule 1 
    if alive_rule1(count)
      #puts "Rule 1"
      return 0
          #test rule 2
    elsif alive_rule2(count)
      #puts "Rule 2"
      return 1
    else
      #test rule 3
      #print ""
      return 0
    end

  #If the cell being evaluated is currently dead      
  else
    #test rule 4
    if alive_rule4(count)
      #puts "Rule 4"
      return 1
    end
  end
end

def alive_rule1(neighbour_count)
    neighbour_count < 2
end

def alive_rule2(neighbour_count)
  neighbour_count == 2 || neighbour_count == 3
end

def alive_rule3(neighbour_count)
  neighbour_count > 3
end

def alive_rule4(neighbour_count)
  neighbour_count == 3
end


#Run just one round of the game

# system "clear"
# starting_grid
# show_grid(@start_grid)
# puts "\n\n" 
# next_grid
# show_grid(@next_gen_grid)


#Initiate the game grid
  system "clear"
  starting_grid

#Run the game
200.times do |t|
  system "clear"
  puts "\n\n" 
  next_grid
  puts "Grid #{t}"
  show_grid(@next_gen_grid)
  sleep(0.18)
end




