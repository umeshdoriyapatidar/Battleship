require 'byebug'
class Battleships
  
  def count_battleships(board,array1,fire2)
    r,c,d,count = board.length,array1.length,fire2.length,0
    return 0 if r == 0
    for j in 0...c
      board[array1[j][0]][array1[j][1]] = 'B'
    end

    for i in 0...d
      if board[fire2[i][0]][fire2[i][1]] == 'B'
        count += 1
        board[fire2[i][0]][fire2[i][1]] = "X"
      else
        board[fire2[i][0]][fire2[i][1]] = "0"
      end
    end

    return board,count
  end


  def create_board(n)
    board = []
    for i in 0...n
      board[i]= []
      for j in 0...n
        board[i][j]= '_'
      end
    end
    board
  end

end

#To convert input given in file formate into array
def array_convert(arry)
  new_arry = Array.new()
  k = arry.length
  temp_arry = []
  for j in 0...k
    e = arry[j]
    if e != ":"
      if e != ","
        temp_arry << e.to_i
      end
    else
      new_arry << temp_arry
      temp_arry = []
    end
  end
  new_arry << temp_arry
  return new_arry
end

bs = Battleships.new()
file_data = File.open("Input.txt", "r").readlines.map(&:chomp);

board1 = bs.create_board(file_data[0].to_i)
board2 = bs.create_board(file_data[0].to_i)
array1 = array_convert(file_data[2])
array2 = array_convert(file_data[3])
fire_by1 = array_convert(file_data[5])
fire_by2 = array_convert(file_data[6])

p2 =  bs.count_battleships(board1,array1,fire_by2)
p1 = bs.count_battleships(board2,array2,fire_by1)

file = File.open('output.txt','w')

file.write("Player1")
file.write("\n")

for i in 0...file_data[1].to_i
  file.write(p2[0][i].join(" "))
  file.write("\n")
end

file.write("Player2")
file.write("\n")

for i in 0...file_data[1].to_i
  file.write(p1[0][i].join(" "))
  file.write("\n")
end

file.write("\n")
file.write(p1[1])
file.write("\n")
file.write(p2[1])
file.write("\n")

if (p1[1]>p2[1])
  file.write("P1 wins ")
elsif(p1[1]<p2[1])
  file.write("P2 wins ")
else
  file.write("Draw ")
end
