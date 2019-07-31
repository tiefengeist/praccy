#Annotate and then consider adding bottom functionality and timestamps for score
#and then sort functionality for a certain time period

class Player
  @@all = []
  @@ids = []

  attr_accessor :player_id, :scores, :total

  def initialize(player_id, score)
    @player_id = player_id
    @total = score.value
    @scores = [score]
    @@ids << player_id
    @@all << self
  end

  def average
    if @scores.length != 0
      @average = @total.to_f / @scores.length
    else
      @average = @total.to_f
    end
  end

  def self.all
    @@all
  end

  def self.ids
     @@ids
  end
end

class Score
  @@all = []
  attr_accessor :value
  def initialize(value)
    @value = value
  end
end

class LeaderBoard
  @@all = []

  attr_accessor :players

  def initialize
    @@all << self
    @players = []
    @ids = []
  end

  def self.all
    @@all
  end

  def add_score(player_id, score_value)

    if !@ids.include?(player_id)
      new_player = Player.new(player_id, Score.new(score_value))
      @players << new_player
      @ids << player_id
    else
      this_player = @players.find{|player| player.player_id == player_id}
      this_player.scores << Score.new(score_value)
      this_player.total += score_value
    end
    @players.find{|player| player.player_id == player_id}.average
  end

  def top(max)
    sortedPlayers = Player.all.sort_by(&:average).reverse
    sortedPlayers.map {|player| player.player_id}.slice(0..max-1)
  end

  def reset(player_id)
    this_player = @players.find{|player| player.player_id == player_id}
    this_player.scores = []
    this_player.total = 0
  end

end

leader_board = LeaderBoard.new
leader_board.add_score(1, 50)
puts leader_board.add_score(2, 80) == 80
puts leader_board.add_score(2, 70) == 75
puts leader_board.add_score(2, 60) == 70
puts leader_board.add_score(3, 90) == 90
puts leader_board.add_score(3, 85) == 87.5
puts leader_board.top(3) === [3, 2, 1]
puts leader_board.top(2) === [3, 2]
leader_board.reset(3)
puts leader_board.top(3) == [2,1,3]
puts leader_board.add_score(3, 600)
puts leader_board.top(3) == [3,2,1]
# Player.all
# leader_board.top
