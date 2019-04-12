class Stack
	def initialize
		@data = []
	end

	def push(el)
		@data.push(el)
	end

	def pop
		@data.pop
	end

	def peek
		@data.first
	end
end
  
def test_stack_class
	x = Stack.new()
	x.push(1)
	x.push(2)
	x.push(3)
	#p x.peek
	p x.pop
	p x.pop
	p x.pop
end