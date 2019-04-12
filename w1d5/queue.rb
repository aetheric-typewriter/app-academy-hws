class Queue
	def initialize
		@data = []
	end
	
	def enqueue(el)
		@data.push(el)
	end
	
	def dequeue 
		@data.shift
	end
	
	def peek
		@data.first
	end
end

def test_queue_class
	x = Queue.new()
	x.enqueue(1)
	x.enqueue(2)
	x.enqueue(3)
	#p x.peek
	p x.dequeue
	p x.dequeue
	p x.dequeue
end