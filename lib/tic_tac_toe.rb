


########## lib ############


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [1,4,7],
  [0,3,6],
  [2,5,8],
  [6,4,2],
  [0,4,8],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index] != " " || board[index].nil?)
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player = "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do | combination |
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      return combination # return the win_combination indexes that won.
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return combination
    end
  end
     false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  turn(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
