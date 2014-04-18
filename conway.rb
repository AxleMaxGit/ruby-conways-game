require 'rubygems'
require 'awesome_print'

class Cell
  def alive_rule1(alive, neighbour_count)
    alive && neighbour_count < 2
  end

  def alive_rule2(alive, neighbour_count)
    alive && neighbour_count > 2 && neighbour_count <5
  end

  def alive_rule3(alive, neighbour_count)
    alive && neighbour_count > 3
  end

  def alive_rule4(alive, neighbour_count)
    !alive && neighbour_count == 3
  end
end

def assert(actual, expected)
  if actual == expected
    print "🔵 "
  else
    puts
    puts "Expected #{actual} == #{expected}"
  end
end

c1 = Cell.new

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

def rand_cell
  rand(2)
end

WIDTH = 8
HEIGHT = 8

def starting_grid
  @start_grid = Array.new(WIDTH){Array.new(HEIGHT)}

  @start_grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      @start_grid[rindex][cindex] = rand_cell
    end
  end
end

def show_grid(grid)
  grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      if grid[rindex][cindex] == 1
        print "⚫️ "
      else
        print "⚪️ "
      end  
    end
    puts "\n"
  end
end

def next_grid
  @next_gen_grid = Array.new(WIDTH){Array.new(HEIGHT)}
  #for each cell in the start grid
  @start_grid.each_with_index do |row, rindex|
    row.each_with_index do |col, cindex|
      #load it into next grid
      @next_gen_grid[rindex][cindex] = @start_grid[rindex][cindex]
    end
  end
    #test if it lives

    #load into next gen grid

  #show the next gen grid for dev&test
    
end

system "clear"
starting_grid
show_grid(@start_grid)
puts "\n\n" 
next_grid
show_grid(@next_gen_grid)










# 4.times do |n|
#   system "clear"
#   starting_grid
#   show_grid(@start_grid)
#   #count_neighbours(1,1)
#   sleep(1)
# end



# def make_grid
#   @start_grid = Array.new(WIDTH){Array.new(HEIGHT)}
#   @next_gen_grid = Array.new(WIDTH){Array.new(HEIGHT)}

#   @start_grid.each_with_index do |row, rindex|
#     row.each_with_index do |col, cindex|
#       @start_grid[rindex][cindex] = rand_cell
#       if @start_grid[rindex][cindex] == 1
#         print "⚫️ "
#       else
#         print "⚪️ "
#       end  
#     end
#     puts "\n"
#   end
# end

# def traverse(row, col)

# end

# def count_neighbours(row, col)
#   cell_count = 0
#   cols = [-1, 0, 1]
#   rows = [-1, 0, 1]
#   cols.each do |c|
#     rows.each do |r|
#       unless c == 0 && r == 0
#         if @start_grid[(row-r)][(col-c)] == 1
#           cell_count += 1
#         end
#       end
#     end
#   end
#   puts cell_count
# end


