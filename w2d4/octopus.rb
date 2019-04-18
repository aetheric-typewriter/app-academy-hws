# Big O-ctopus and Biggest Fish

# A Very Hungry Octopus wants to eat the longest fish in an array of fish.

# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"





# Sluggish Octopus

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
# Dominant Octopus

def sluggish_octopus(arr)
	arr.each do |fish_i|
		potential_max = fish_i
		arr.each do |fish_j|
			potential_max = fish_j.length > potential_max.length ? nil : potential_max 
		end
		return potential_max unless potential_max.nil?
	end
end



#Dominant Octopus

# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Complexity Demo. Accessing this on GitHub? Use this link. Remember that Big O is classified by the dominant term.

def dominant_octopus(arr)
	sorted = merge_sort_str(arr)
	sorted.last
end

def merge_sort_str(arr)
	return arr if arr.length <= 1
	
	mid = arr.length / 2
	left = arr[0..mid]
	right = arr[(mid + 1)..-1]
	
	sorted_left = merge_sort_str(left)
	sorted_right = merge_sort_str(right)
	
	merge(sorted_left, sorted_right)
end

def merge(left, right)
	sorted = []
	until left.empty? || right.empty?
		if left.first.length > right.first.length
			sorted << left.shift
		else
			sorted << right.shift
		end
	end 
	sorted + left + right
end


# Clever Octopus

# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(array)
	arr = array.dup
	
	longest = arr.pop
	
	arr.each do |el|
		longest = el if el.length > longest.length
	end
end




# Dancing Octopus

# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.





# Slow Dance

# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.

# slow_dance("up", tiles_array)
# > 0

# slow_dance("right-down", tiles_array)
# > 3

def slow_dance(str, arr)
	arr.each_with_index do |el, i|
		return i if str == el
	end
end






# Constant Dance!

# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

# fast_dance("up", new_tiles_data_structure)
# > 0

# fast_dance("right-down", new_tiles_data_structure)
# > 3

def fast_dance(str, hash)
	hash[str]
end