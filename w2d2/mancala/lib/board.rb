class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
	@name2 = name2
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
	arr = Array.new(14) { Array.new(4, :stone) }
	arr[6] = []
	arr[13] = []
	
	self.cups = arr
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless (0...14).include?(start_pos)
    raise "Starting cup is empty" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    temp = cups[start_pos]
    cups[start_pos] = []
    
    opponent_store_map = {@name1 => 13, @name2 => 6}
	opponent_store = opponent_store_map[current_player_name]
    
    i = (start_pos + 1) % 14
    
    until temp.empty?
	  unless i == opponent_store
	    cups[i] << temp.pop
	  end
	  i = (i + 1) % 14
    end
	
	self.render
	
	i = (i - 1) % 14
	player_store_map = {@name1 => 6, @name2 => 13}
	return :prompt if i == player_store_map[current_player_name]
	
	next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
	i = ending_cup_idx
	
	if cups[i].empty?
	  return :switch
	else
	  return i
	end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
