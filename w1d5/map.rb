class Map
	def initialize
		@pairs = []
	end
	
	def set(key, value)
		self.delete(key)
		@pairs << [key, value]
	end
	
	def get(key)
		@pairs.each do |pair|
			return pair[1] if pair[0] == key
		end
	end
	
	def delete(key)
		@pairs = @pairs.reject { |pair| pair[0] == key }
	end
	
	def show
		p @pairs
	end
end

def test_map_class
	x = Map.new
	x.set("a", 1)
	x.set("b", 2)
	x.set("c", 3)
	p "adding (a, 1), (b, 2), and (c, 3) to map"
	x.show
	
	p "changing value of a"
	x.set("a", 100)
	x.show
	
	p "deleting c"
	x.delete("c")
	x.show
	
	p "getting value of b"
	p x.get("b")
end