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

  #didn't make getter and setter methods, since average depends
  #on known quantities, so can use instance method
  def average
    #this conditional is so sorting works when a player has no scores
    #to keep types being compared the same
    if @scores.length != 0
      @average = @total.to_f / @scores.length
    else
      @average = 0
    end
  end

  def self.all
    @@all
  end

  def self.ids
     @@ids
  end
end

#score is its own class instead of part of player so we can add
#features later if we want (lb has many p thru s)
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

    #check if player has scores using input id
    #if not, create and add new player, and id
    if !@ids.include?(player_id)
      new_player = Player.new(player_id, Score.new(score_value))
      @players << new_player
      @ids << player_id
      #if player already has scores, find player, add score, add to total
    else
      this_player = @players.find{|player| player.player_id == player_id}
      this_player.scores << Score.new(score_value)
      this_player.total += score_value
    end
    #return the player's average
    @players.find{|player| player.player_id == player_id}.average
  end

  def top(num_players)
    #sort players by their average, since iterating over players
    #can use instance method 'average'
    sortedPlayers = Player.all.sort_by(&:average).reverse
    #take sorted player objects, extract ids, return "num_players" entries
    sortedPlayers.map {|player| player.player_id}.slice(0..num_players-1)
  end

  def reset(player_id)
    #find player, empty scores array, reset total
    this_player = @players.find{|player| player.player_id == player_id}
    this_player.scores = []
    this_player.total = 0
  end

end

#new leaderboard instance
leader_board = LeaderBoard.new
#99-104 test if add_score returns proper averages
puts leader_board.add_score(1, 50) == 50
puts leader_board.add_score(2, 80) == 80
puts leader_board.add_score(2, 70) == 75
puts leader_board.add_score(2, 60) == 70
puts leader_board.add_score(3, 90) == 90
puts leader_board.add_score(3, 85) == 87.5

#107-109 check if top works
puts leader_board.top(3) === [3, 2, 1]
puts leader_board.top(2) === [3, 2]
puts leader_board.top(1) === [3]

#112-115 check if we can reset, and have add_score/average still work
leader_board.reset(3)
puts leader_board.top(3) == [2,1,3]
puts leader_board.add_score(3, 600)
puts leader_board.top(3)
