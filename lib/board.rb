class Board

	def initialize
	end


	def place(ship, coord)
		coord.each do |c|
			coords << c
		end
	end

	def coords
		@coords ||= []
	end


	def ships
		@ships ||= []
	end


	def what_ship_is_at(coord)
		index = ''
		index = self.coords.find_index { |c| c.match(coord) } #searches for coord and returns index
		ships[index]
	end


	def place_south(ship, coord)
		coords << coord
		ships << ship
		(ship.length-1).times do
			coord1 = coords[-1].scan(/\d+|\w/)[0]
			coord2 = coords[-1].scan(/\d+|\w/)[1].next
			raise "Can't be placed outside board" if coord1 > ('J')
			raise "Can't be placed outside board" if coord2.to_i > 10
			coords << coord1+coord2
			ships << ship
		end
		coords
	end


	def place_east(ship, coord)
		coords << coord
		ships << ship
			(ship.length-1).times do											#loop that incriments only the letter
			coord1 = coords[-1].scan(/\d+|\w/)[0].next		#incriments letter from last item in array
			coord2 = coords[-1].scan(/\d+|\w/)[1]					#keeps number from last item in array
			raise "Can't be placed outside board" if coord1 > ('J')
			raise "Can't be placed outside board" if coord2.to_i > 10
			coords << coord1+coord2												#adds coordinate to array
		ships << ship
		end
		coords
	end


	def fire(marker)
		if coords.include?(marker.location)
			what_ship_is_at(marker.location).hit!
		else
			"Missed"
		end
	end

end