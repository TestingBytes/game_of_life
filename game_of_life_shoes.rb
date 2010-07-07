#
# This is a Shoes app to visualize your game of life.
#

## REQUIRE YOUR OWN CLASS HERE ##

Shoes.setup do
  gem 'shoes'
end

require 'lib/game_of_life'
require 'rubygems'
require 'shoes'

Shoes.app do
  para "Welcome To Game Of Life"
end
