# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  #top_row_win [X,X,X,a,a,a,a,a,a]
  [3,4,5], #center_row_win [a,a,a,X,X,X,a,a,a]
  [6,7,8], #bottom_row_win [a,a,a,a,a,a,O,O,O]
  [0,3,6], #left_column_win [O,a,a,O,a,a,O,a,a]
  [1,4,7], #center_column_win [a,O,a,a,O,a,a,O,a]
  [2,5,8], #right_column_win [a,a,X,a,a,X,a,a,X]
  [0,4,8], #left_diagonal_win [X,a,a,a,X,a,a,a,X]
  [2,4,6] #right_diagonal_win [a,a,O,a,O,a,O,a,a]
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
   if board[win_combination[0]]=="X"&&
      board[win_combination[1]]=="X"&&
      board[win_combination[2]]=="X"
      return win_combination
   elsif board[win_combination[0]]=="O"&&
      board[win_combination[1]]=="O" &&
      board[win_combination[2]]=="O"
      return win_combination
   end
  end
end




def full?(board)
  if board.include? " " || nil
    return false
  else
    return true
  end
end



def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      if board[win_combination[0]]=="X"&&
        board[win_combination[1]]=="X"&&
        board[win_combination[2]]=="X"
        return "X"
      elsif board[win_combination[0]]=="O"&&
        board[win_combination[1]]=="O" &&
        board[win_combination[2]]=="O"
        return "O"
      end
    end
  else
    return nil
  end
end 
