  #
  #
  # def add_score(player_id, score)
  #
  # end
  #
  # def top(max)
  # end
  #
  # def reset(player_id)
  # end


class Player
  @@all = []
  def initialize(player_id, score)
    @player_id = player_id
    @score = score
    @@all << self
    # @@all << self
    # @id = player_id
    # @scores = [score]
    # @total = score
    # @average = self.total / self.scores.size
  end
end

class Score(number)
  @@all = []
  def initialize
    self.number = number
  end
end

class LeaderBoard
  @@all = []
  def initialize
    @@all << self
    @players = {}
  end

  def
    add_score(player_id, score_value)
    new_player = Player.new(player_id, score_value)
    puts new_player
    puts new_player.score
  end

end


#TEST CASES

leader_board = LeaderBoard.new

leader_board.add_score(1, 50)

# puts(leader_board.add_score(2, 80) == 80)

# puts(leader_board.add_score(2, 70) == 75)
#
# puts(leader_board.add_score(2, 60) == 70)
#
# puts(leader_board.add_score(3, 90) == 90)
#
# puts(leader_board.add_score(3, 85) == 87.5)
#
#
#
# puts(leader_board.top(3) == [3, 2, 1])
#
# puts(leader_board.top(2) == [3, 2])
#
# leader_board.reset(3)
#
# puts(leader_board.top(3) == [2, 1, 3])
