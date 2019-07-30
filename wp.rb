class Player
  @@all = []
  @@ids = []
  def initialize(player_id, score)
    @player_id = player_id
    @score = score
    @@ids << player_id
    @@all << self
  end

  def score
    puts @score
  end

  def player_id
    puts @player_id
  end

  def self.all
    puts @@all
  end

  def self.ids
     puts @@ids
  end
end

class LeaderBoard
  @@all = []
  def initialize
    @@all << self
    @players = []
  end

  def self.all
    @@all
  end

  # def self.players
  #   @players
  # end

  def add_score(player_id, score_value)
    new_player = Player.new(player_id, score_value)
    @players << new_player
    # for x in @players
    #   puts x.player_id
    # end
  end

end

lb = LeaderBoard.new
# LeaderBoard.all
lb.add_score(3, 5)
lb.add_score(4, 15)
lb.add_score(3, 20)
puts Player.ids

# puts LeaderBoard.all
# puts lb.players
