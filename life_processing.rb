#
# This is a Shoes app to visualize your game of life.
#

## REQUIRE YOUR OWN CLASS HERE ##

require 'lib/game_of_life'

class Sketch < Processing::App

  attr_reader :game, :cell_w, :cell_h

  def setup
    size width,height
    background 0
    color_mode RGB, 255
    frame_rate 10 

    @game = GameOfLife.new(100)

    @game.state = @game.state.map { |row| row.map { |cell| rand(2) } }
    @cell_w = width  / @game.size
    @cell_h = height / @game.size
  end

  def draw
    0.upto(@game.size-1) { |row|
      0.upto(@game.size-1) { |col|
        @game.state[row][col] == 1 ? fill(128) : fill(0) 
        rect row*@cell_w, col*@cell_h, @cell_w, @cell_h 
      }
    }
    @game.evolve
  end

  def key_pressed
    case key
    when 'r'
      @game = GameOfLife.new(100)
      @game.state = @game.state.map { |row| row.map { |cell| rand(2) } }
    end
  end
end

Sketch.new(:width => 400, :height => 400, :title => "The Game Of Life")