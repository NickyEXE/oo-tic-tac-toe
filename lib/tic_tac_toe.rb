require 'pry'
class TicTacToe

  @@all = []
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index >= 0 && index <= 8
  end

  def turn_count
    @board.select{|position| position != " "}.size
    # filter out the portion of the array that's blank
    # count how long the filtered array is
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Enter the space you'd like to play on:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      # make a move, using the index we just got,
      # and the current_player method to figure out whether it's X or O
      move(index, current_player)
    else
      puts "Invalid move, try again you buffoon it's tic tac toe it's not that hard"
      # this is recursion. Calling a method inside its own definition is allowed.
      # If you use recursion, ensure you have a "base case", a conditional that stops it from repeating
      # Otherwise, you get an infinite loop
      turn
    end
    display_board
  end

end

game = TicTacToe.new

game.turn
game.turn
game.turn
game.turn
