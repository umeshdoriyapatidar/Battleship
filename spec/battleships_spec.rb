require_relative '/home/developer/Battelship Task/battleships.rb'

describe Battleships do 
  context "When testing the battleships class" do 
     it "The create_board method should return 'array with every element _'" do 
      bs =Battleships.new()
      board = bs.create_board(3)
      expect(board).to match_array([["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]) 
     end

     it "The count_battleship method should return 'array with expected element' " do
      bs = Battleships.new()
      board = bs.create_board(5)
      array1 = [[1,1],[2,0],[2,3],[3,4],[4,3]]
      fire2  = [[2,4],[0,0],[1,1],[2,3],[4,3]]
      p2 = bs.count_battleships(board,array1,fire2)
      expect(p2).to match_array([[["0", "_", "_", "_", "_"], ["_", "X", "_", "_", "_"], ["B", "_", "_", "X", "0"], ["_", "_", "_", "_", "B"], ["_", "_", "_", "X", "_"]], 3])
     end
  end
end