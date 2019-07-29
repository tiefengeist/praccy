class LeaderBoard
  @@all = []
  def initialize
    @@all << self
  end

  def add_score(player_id, score)
    @player = player_id
    @score = score
  end
end
