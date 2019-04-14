class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
	self.sequence_length = 1
	self.game_over = false
	self.seq = []
  end

  def play
	until self.game_over
		self.take_turn
	end
	self.game_over_message
	self.reset_game
  end

  def take_turn
	self.require_sequence
	unless self.game_over
		self.round_success_message 
		self.show_sequence
		self.sequence_length += 1
	end
  end

  def show_sequence
	self.add_random_color
  end

  def require_sequence
	#method behavior is unspecified
	if seq.last
		puts "Simon says: '#{seq.last}'!"
		puts "Your input: "
		data = gets.chomp
		self.game_over = true unless data == seq.last
	end
  end

  def add_random_color
	self.seq << COLORS.sample
  end

  def round_success_message
	#method behavior is unspecified
	puts "Correct! " if seq.length > 0
  end

  def game_over_message
	#method behavior is unspecified
	puts "Incorrect. This game has ended.\nLet's play again.\n\n"
  end

  def reset_game
	self.sequence_length = 1
	self.game_over = false
	self.seq = []
  end
end
